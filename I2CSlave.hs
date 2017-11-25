{-# LANGUAGE RecordWildCards #-}

module I2CSlave where

import CLaSH.Prelude
import Control.Monad
import Control.Monad.Trans.State


syncReg :: Signal Bool -> Signal Bool
syncReg = 
  flip mealy (True,True) $
  \(p1,p0) c -> ((p0,c),p1)

negReg :: Signal Bool -> Signal Bool
negReg =
  flip mealy True $
  \p c -> (c,p && (not c))

posReg :: Signal Bool -> Signal Bool
posReg = 
  flip mealy True $
  \p c -> (c,(not p) && c)

shiftReg :: Signal (Bool,Bool) -> Signal (BitVector 8)
shiftReg = flip mealy (0) $
  \(reg) (enb,bit) ->
    let nxt = if enb then (shiftL reg 1) .|. (if bit then 1 else 0) else reg
    in (nxt,reg)

ifp :: Signal Bool -> Signal a -> Signal a -> Signal a
ifp a b c = if' <$> a <*> b <*> c
  where
    if' a' b' c' = if a' then b' else c'

i2cSlave :: Signal (Bool,Bool,   --- ^ scl_in,sda_in
                    BitVector 7, --- ^ dev_adr
                    BitVector 8) --- ^ tx_data
         -> Signal (Bool,        --- ^ sda_out
                    Bool,        --- ^ enb
                    Bool,        --- ^ enb
                    Bool,        --- ^ wr
                    BitVector 7, --- ^ adr
                    BitVector 8) --- ^ rx_data
i2cSlave in' = bundle (sda_out,adr_enb,dat_enb,wr,adr,dat)
  where
    (scl_in,sda_in,dev_adr,tx_data) = unbundle in'
    p_scl_in = register True $ scl_in
    p_sda_in = register True $ sda_in
    start    = register False $ scl_in .&&. p_scl_in .&&. (not <$> sda_in) .&&. p_sda_in
    stop     = register False $ scl_in .&&. p_scl_in .&&. sda_in .&&. (not <$> p_sda_in)
    rx_data  = register False $ sda_in
    rstrobe  = register False $ (not <$> scl_in) .&&. p_scl_in
    strobe   = register False $ scl_in .&&. (not <$> p_scl_in)
    sda_out  = register True $ ack .&&. tx_out
    cnt :: Signal (BitVector 5)
    cnt      = register 0     $
               ifp start (signal 0) $
               ifp strobe (cnt + (signal 1)) cnt
    shf :: BitVector 8 -> Bool -> BitVector 8
    shf reg bit = (shiftL reg 1) .|. (if bit then 1 else 0)
    shiftReg :: Signal (BitVector 8)
    shiftReg = register 0 $
               ifp start 0 $
               ifp strobe (shf <$> shiftReg <*> rx_data) $
               shiftReg
    shiftReg7 :: Signal (BitVector 7)
    shiftReg7 = (slice d6 d0) <$> shiftReg
    adr :: Signal (BitVector 7)
    adr      = register 0     $ ifp start 0     $ ifp ((cnt .==. signal 7) .&&. strobe) shiftReg7 adr
    dev_sel  = dev_adr .==. adr
    wr       = register False $
               ifp start (signal False) $
               ifp ((cnt .==. signal 8) .&&. strobe .&&. dev_sel) rx_data wr
    adr_enb  = register False $
               ifp start (signal False) $
               ifp ((cnt .==. signal 8) .&&. strobe .&&. dev_sel) (signal True) $
               (signal False)
    tx_data' = register 0     $
               ifp start (signal 0)     $
               ifp (adr_enb .&&. wr) tx_data tx_data'
    conv :: BitVector 8 -> Int -> Bool
    conv dat idx = (dat ! idx) == 1
    tx_out   = register True $
               ifp start (signal True) $
               ifp ((cnt .==. signal 10) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 7) $
               ifp ((cnt .==. signal 11) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 6) $
               ifp ((cnt .==. signal 12) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 5) $
               ifp ((cnt .==. signal 13) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 4) $
               ifp ((cnt .==. signal 14) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 3) $
               ifp ((cnt .==. signal 15) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 2) $
               ifp ((cnt .==. signal 16) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 1) $
               ifp ((cnt .==. signal 17) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 0) $
               tx_out
    ack      = register False $
               ifp start (signal False) $
               ifp ((cnt .==. signal 8) .&&. strobe .&&. dev_sel)  (signal True) $
               ifp ((cnt .==. signal 9) .&&. strobe .&&. dev_sel)  (signal False) $
               ifp ((cnt .==. signal 16) .&&. strobe .&&. dev_sel) (signal True) $
               ifp ((cnt .==. signal 17) .&&. strobe .&&. dev_sel) (signal False) $
               ack
    dat      = register 0     $ ifp start (signal 0    ) $ ifp ((cnt .==. signal 15) .&&. strobe) shiftReg dat
    dat_enb  = register False $ ifp start (signal False) $ ifp ((cnt .==. signal 16) .&&. strobe .&&. dev_sel) (signal True) (signal False)

topEntity :: Signal (Bool,Bool,   --- ^ scl_in,sda_in
                    BitVector 7, --- ^ dev_adr
                    BitVector 8) --- ^ tx_data
         -> Signal (Bool,        --- ^ sda_out
                    Bool,        --- ^ enb
                    Bool,        --- ^ enb
                    Bool,        --- ^ wr
                    BitVector 7, --- ^ adr
                    BitVector 8) --- ^ rx_data
topEntity = i2cSlave
