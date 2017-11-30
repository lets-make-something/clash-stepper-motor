{-# LANGUAGE RecordWildCards #-}

module I2CSlave where

import Clash.Prelude
import Control.Monad
import Control.Monad.Trans.State


{-# INLINE ifp #-}
ifp :: HasClockReset domain gated synchronous
    => Signal domain Bool -> Signal domain a -> Signal domain a -> Signal domain a
ifp a b c = if' <$> a <*> b <*> c
  where
    if' a' b' c' = if a' then b' else c'

i2cSlave :: HasClockReset domain gated synchronous
         => Signal domain (Bool,Bool,   --- ^ scl_in,sda_in
                           BitVector 7, --- ^ dev_adr
                           BitVector 8) --- ^ tx_data
         -> Signal domain (Bool,        --- ^ sda_out
                           Bool,        --- ^ adr_enb
                           Bool,        --- ^ dat_enb
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
--    cnt :: Signal domain (BitVector 5)
    cnt      = register 0     $
               ifp start (pure 0) $
               ifp strobe (cnt + (pure 1)) cnt
    shf :: BitVector 8 -> Bool -> BitVector 8
    shf reg bit = (shiftL reg 1) .|. (if bit then 1 else 0)
--    shiftReg :: Signal domain (BitVector 8)
    shiftReg = register 0 $
               ifp start (pure 0) $
               ifp strobe (shf <$> shiftReg <*> rx_data) $
               shiftReg
--    shiftReg7 :: Signal domain (BitVector 7)
    shiftReg7 = (slice d6 d0) <$> shiftReg
--    adr :: Signal domain (BitVector 7)
    adr      = register 0     $ ifp start (pure 0)     $ ifp ((cnt .==. pure 7) .&&. strobe) shiftReg7 adr
    dev_sel  = dev_adr .==. adr
    wr       = register False $
               ifp start (pure False) $
               ifp ((cnt .==. pure 8) .&&. strobe .&&. dev_sel) rx_data wr
    adr_enb  = register False $
               ifp start (pure False) $
               ifp ((cnt .==. pure 8) .&&. strobe .&&. dev_sel) (pure True) $
               (pure False)
    tx_data' = register 0     $
               ifp start (pure 0)     $
               ifp (adr_enb .&&. wr) tx_data tx_data'
    conv :: BitVector 8 -> Int -> Bool
    conv dat idx = (dat ! idx) == 1
    tx_out   = register True $
               ifp start (pure True) $
               ifp ((cnt .==. pure 10) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 7) $
               ifp ((cnt .==. pure 11) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 6) $
               ifp ((cnt .==. pure 12) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 5) $
               ifp ((cnt .==. pure 13) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 4) $
               ifp ((cnt .==. pure 14) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 3) $
               ifp ((cnt .==. pure 15) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 2) $
               ifp ((cnt .==. pure 16) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 1) $
               ifp ((cnt .==. pure 17) .&&. strobe .&&. dev_sel) (conv <$> tx_data' <*> 0) $
               tx_out
    ack      = register False $
               ifp start (pure False) $
               ifp ((cnt .==. pure 8) .&&. strobe .&&. dev_sel)  (pure True) $
               ifp ((cnt .==. pure 9) .&&. strobe .&&. dev_sel)  (pure False) $
               ifp ((cnt .==. pure 16) .&&. strobe .&&. dev_sel) (pure True) $
               ifp ((cnt .==. pure 17) .&&. strobe .&&. dev_sel) (pure False) $
               ack
    dat      = register 0     $ ifp start (pure 0    ) $ ifp ((cnt .==. pure 15) .&&. strobe) shiftReg dat
    dat_enb  = register False $ ifp start (pure False) $ ifp ((cnt .==. pure 16) .&&. strobe .&&. dev_sel) (pure True) (pure False)

topEntity :: SystemClockReset
          =>Signal System (Bool,Bool,   --- ^ scl_in,sda_in
                           BitVector 7, --- ^ dev_adr
                           BitVector 8) --- ^ tx_data
          -> Signal System (Bool,        --- ^ sda_out
                            Bool,        --- ^ enb
                            Bool,        --- ^ enb
                            Bool,        --- ^ wr
                            BitVector 7, --- ^ adr
                            BitVector 8) --- ^ rx_data
topEntity = i2cSlave
