{-# LANGUAGE RecordWildCards #-}

module Top where

import CLaSH.Prelude
import Control.Monad
import Control.Monad.Trans.State

import I2CSlave
import StepperMotor




stepperReg :: Signal (Bool,        --- ^ enb
                      Bool,        --- ^ wr_enb                     
                      BitVector 7, --- ^ dev_adr
                      BitVector 8) --- ^ wr_dat
           -> Signal (BitVector 8, --- ^ rd_dat
                      Vec 30 (BitVector 8)) --- ^ StepperRegs
stepperReg in' = bundle (rd_dat,regs)           
  where
    (enb,wr_enb,dev_adr,wr_dat) = unbundle in'
    regs :: Signal (Vec 30 (BitVector 8))
    regs = register (repeat (0)) $
      ifp (wr_enb .==. signal True) (replace <$> dev_adr <*> wr_dat <*> regs) regs
    rd_dat = 0


stepperReg' :: Signal (Bool,        --- ^ enb
                       Bool,        --- ^ wr_enb                     
                       BitVector 7, --- ^ dev_adr
                       BitVector 8) --- ^ wr_dat
            -> Signal (BitVector 8, --- ^ rd_dat
                       Vec 30 (Bool,Bool)) --- ^ StepperRegs
stepperReg' in' = bundle (rd_dat,regs')
  where
    (rd_dat,regs) = unbundle $ stepperReg in'
    vec2pair :: BitVector 8 -> (Bool,Bool)
    vec2pair v = (v ! 1 == high,v ! 0 == high)
    regs' = (map vec2pair) <$> regs


top :: Signal (Bool,Bool)   --- ^ scl_in,sda_in
    -> Signal (Bool,        --- ^ sda_out
               Vec 30 (BitVector 4)) --- ^ stepper output
top in' = bundle (sda_out,stepper_out)
  where
    (scl_in,sda_in) = unbundle in'
    (sda_out,adr_enb,dat_enb,wr,adr,rx_data) = unbundle $ i2cSlave $ bundle (scl_in,sda_in,signal 0,tx_data)
    (tx_data,regs) = unbundle $ stepperReg' $ bundle (dat_enb,wr,adr,rx_data)
    stepper_out = bundle (map stepperMotor $ unbundle regs)


topEntity :: Signal (Bool,Bool)   --- ^ scl_in,sda_in
          -> Signal (Bool,        --- ^ sda_out
                     Vec 30 (BitVector 4)) --- ^ stepper output
topEntity = top
