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

stepperMotor :: Signal Bool -> Signal Bool -> Signal (BitVector 4)
stepperMotor dir en = output
  where
    output = register 0 $ driverOutput <$> state
    state = register 0 $ next <$> dir <*> en <*> state
    

topEntity :: Signal Bool -> Signal Bool -> Signal (BitVector 4)
topEntity = stepperMotor

--testInput :: Signal (Signed 16)
--testInput = stimuliGenerator (2:>3:>(-2):>8:>Nil)

--expectedOutput :: Signal (Signed 16) -> Signal Bool
--expectedOutput = outputVerifier (4:>12:>1:>20:>Nil)
