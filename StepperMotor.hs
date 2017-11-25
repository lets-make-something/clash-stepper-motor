module StepperMotor where

import CLaSH.Prelude

next :: Bool -> Bool -> BitVector 3 -> BitVector 3
next dir en state =
  case state of
    0 ->
      case en of
        True -> 1
        False -> 0
    1 ->
      case (dir,en) of
        (False,True) -> 4
        (True,True) -> 2
        _ -> 0
    2 ->
      case (dir,en) of
        (False,True) -> 1
        (True,True) -> 3
        _ -> 0
    3 ->
      case (dir,en) of
        (False,True) -> 2
        (True,True) -> 4
        _ -> 0
    4 ->
      case (dir,en) of
        (False,True) -> 3
        (True,True) -> 1
        _ -> 0
    _ -> 0


driverOutput :: BitVector 3 -> BitVector 4
driverOutput stat =
  case stat of
    0 -> 0b0000
    1 -> 0b0001
    2 -> 0b0010
    3 -> 0b0100
    4 -> 0b1000
    _ -> 0b0000

stepperMotor :: Signal (Bool,Bool) -> Signal (BitVector 4)
stepperMotor in' =  register 0 (output in')
  where
    output = flip mealy 0 $ \s (dir,en) ->
                             let n = next dir en s
                             in (n,driverOutput n)
    

topEntity :: Signal (Bool,Bool) -> Signal (BitVector 4)
topEntity = stepperMotor

testInput :: Signal (Bool,Bool)
testInput = stimuliGenerator $
  (True,False):>(True,True):>(True,True):>(True,True):>(True,True):>(True,True):>(True,True):>Nil

expectedOutput :: Signal (BitVector 4) -> Signal Bool
expectedOutput = outputVerifier $
  0b0000:>0b0000:>0b0001:>0b0010:>0b0100:>0b1000:>0b0001:>Nil
