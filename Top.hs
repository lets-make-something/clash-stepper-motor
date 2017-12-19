{-# LANGUAGE RecordWildCards #-}

module Top where

import Clash.Prelude

import I2CSlave
import StepperMotor




stepperReg :: HasClockReset domain gated synchronous
           => Signal domain (Bool,        --- ^ enb
                             Bool,        --- ^ wr_enb                     
                             BitVector 7, --- ^ dev_adr
                             BitVector 8) --- ^ wr_dat
           -> Signal domain (BitVector 8, --- ^ rd_dat
                             Vec 18 (BitVector 8)) --- ^ StepperRegs
stepperReg in' = bundle (rd_dat,regs)           
  where
    (enb,wr_enb,dev_adr,wr_dat) = unbundle in'
--    regs :: Signal (Vec 18 (BitVector 8))
    regs = register (repeat (0)) $
      ifp (wr_enb .==. pure True) (replace <$> dev_adr <*> wr_dat <*> regs) regs
    rd_dat = 0


stepperReg' :: HasClockReset domain gated synchronous
            => Signal domain (Bool,        --- ^ enb
                              Bool,        --- ^ wr_enb                     
                              BitVector 7, --- ^ dev_adr
                              BitVector 8) --- ^ wr_dat
            -> Signal domain (BitVector 8, --- ^ rd_dat
                              Vec 18 (Bool,Bool)) --- ^ StepperRegs
stepperReg' in' = bundle (rd_dat,regs')
  where
    (rd_dat,regs) = unbundle $ stepperReg in'
    vec2pair :: BitVector 8 -> (Bool,Bool)
    vec2pair v = (v ! 1 == high,v ! 0 == high)
    regs' = (map vec2pair) <$> regs


top :: HasClockReset domain gated synchronous
    => Signal domain (Bool,Bool)   --- ^ scl_in,sda_in
    -> Signal domain (Bool,        --- ^ sda_out
                      Vec 18 (BitVector 4)) --- ^ stepper output
top in' = bundle (sda_out,stepper_out)
  where
    (scl_in,sda_in) = unbundle in'
    (sda_out,adr_enb,dat_enb,wr,adr,rx_data) = unbundle $ i2cSlave $ bundle (scl_in,sda_in,pure 0,tx_data)
    (tx_data,regs) = unbundle $ stepperReg' $ bundle (dat_enb,wr,adr,rx_data)
    stepper_out = bundle (map stepperMotor $ unbundle regs)


topEntity :: SystemClockReset
          => Signal System (Bool,Bool)   --- ^ scl_in,sda_in
          -> Signal System (Bool,        --- ^ sda_out
                     Vec 18 (BitVector 4)) --- ^ stepper output
topEntity = top
