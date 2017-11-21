module I2CSlave where

import CLaSH.Prelude

syncReg :: Signal Bool -> Signal Bool
syncReg i = register True $ register True $ i

negReg :: Signal Bool -> Signal Bool
negReg i = edge <$> i <*> ii
  where
    edge a b = a && (not b)
    ii = register True i 

posReg :: Signal Bool -> Signal Bool
posReg i = edge <$> i <*> ii
  where
    edge a b = (not a) && b
    ii = register True i 

detectSignal :: Signal Bool --- ^ scl_in
             -> Signal Bool --- ^ sda_in
             -> (Signal Bool, Signal Bool, Signal Bool, Signal Bool) --- ^ (start,stop,data,strobe)
detectSignal scl_in sda_in = (start,stop,sdata,strobe)
  where
    p_scl_in = register True scl_in
    p_sda_in = register True sda_in
    start = register False $ (\a b c d -> a && b && (not c) && d) <$> scl_in <*> p_scl_in <*> sda_in <*> p_sda_in
    stop = register False $ (\a b c d -> a && b && c && (not d)) <$> scl_in <*> p_scl_in <*> sda_in <*> p_sda_in
    sdata = register False $ (\a b c d -> if a && (not b) then c else d) <$> scl_in <*> p_scl_in <*> sda_in <*> sdata
    strobe = register False $ (\a b -> a && (not b)) <$> scl_in <*> p_scl_in

