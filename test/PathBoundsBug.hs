{-# LANGUAGE NoMonomorphismRestriction #-}

module PathBoundsBug (diagram, main) where

import Diagrams.Prelude

import Diagrams.Backend.Cairo.CmdLine

t :: Trail V2 Double
t = polygon (def & polyType .~ PolyRegular 3 1 & polyOrient .~ OrientTo unitX)

v1, v2 :: V2 Double
(v1:v2:_) = trailOffsets t

s :: Trail V2 Double
s = fromSegments [Cubic v1 v1 (OffsetClosed (v1 ^+^ v2))]

s1 :: Diagram B
s1 = (strokeT $ s <> (rotateBy (1/3) s) <> (rotateBy (2/3) s))
   # centerXY

dia :: Diagram B
dia = pad 1.1 (s1 ||| unitSquare)

diagram :: Diagram B
diagram = dia

main :: IO ()
main = defaultMain diagram
