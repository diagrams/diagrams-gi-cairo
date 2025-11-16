{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module Adjust (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine
import Diagrams.Parametric.Adjust

-- s = Linear (1,1)
-- s' = adjustSegment s (with & adjMethod .~ ByParam 0.3 & adjSide .~ Both)

s :: Segment Closed V2 Double
s = Cubic (r2 (-1.469563859939651,-7.0543643759197145)) (r2 (-15.71112972096714,10.354074559684419)) (OffsetClosed (r2 (-3.041713868997588,-5.064951590019016)))
-- arc length = 18.5

s' :: Segment Closed V2 Double
s' = adjust s (with & adjMethod .~ ToAbsolute 5.0 & adjSide .~ End)

s2 :: Segment Closed V2 Double
s2 = Cubic (r2 (0.8481056976928445,-0.7672709057378255)) (r2 (1.1571739382091348,0.3803092030511929)) (OffsetClosed (r2 (1.2613155540667786,-0.6362037010168534)))

s2' :: Segment Closed V2 Double
s2' = adjust s2 (with & adjMethod .~ ToAbsolute 0.8329103042366314 & adjSide .~ Both)

p1Seg :: Diagram B
p1Seg = fromSegments [s2'] # lc red

p2Seg :: Diagram B
p2Seg = fromSegments [s2]

d :: Diagram B
d = p1Seg <> p2Seg <> square 1 <> b # centerXY

b :: Diagram B
b = square 2 # lw 0

diagram :: Diagram B
diagram = pad 1.1 $ d

main :: IO ()
main = defaultMain diagram