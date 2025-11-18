{-# LANGUAGE NoMonomorphismRestriction #-}

module BezParam (diagram, main) where

import Diagrams.Prelude

import Diagrams.Backend.Cairo.CmdLine

t :: Trail V2 Double
t = polygon (def & polyType .~ PolyRegular 3 1 & polyOrient .~ OrientTo unitX)

v1, v2 :: V2 Double
(v1:v2:_) = trailOffsets t

seg :: Segment Closed V2 Double
seg = Cubic v1 v1 (OffsetClosed (v1 ^+^ v2))

s :: Trail V2 Double
s = fromSegments [seg]

pts :: [Point V2 Double]
pts = map ((origin .+^) . (seg `atParam`)) [0,0.01..1]

showPts :: Diagram B
showPts = position (pts `zip` repeat (circle 0.01 # lw 0 # fc red :: Diagram B))

-- s1 = (strokeT $ s <> (rotateBy (1/3) s) <> (rotateBy (2/3) s))
--    # centerXY

dia :: Diagram B
dia = pad 1.1 (showPts `atop` strokeT s)

diagram :: Diagram B
diagram = dia

main :: IO ()
main = defaultMain diagram
