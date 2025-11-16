{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module Inside (diagram, main) where

import Diagrams.Prelude
import Diagrams.TwoD.Path
import Diagrams.Backend.Cairo.CmdLine

import qualified Data.Set as S

-- t = fromOffsets [(1,5), (1,-5)]
-- path = close . pathFromTrail . mconcat . take 8 . iterate (rotateBy (-1/8)) $ t

       -- polygonPath with {sides=8}

-- path = close . fromOffsets $ [(0,10), (3,0), (0, -8), (2,0), (0,2), (-4,0), (0, 3)
--                              ,(9, 0), (0, -7)]

t :: Trail V2 Double
t = polygon (def & polyType .~ PolyRegular 3 1 & polyOrient .~ OrientTo unitX)

v1, v2 :: V2 Double
(v1:v2:_) = trailOffsets t

seg :: Segment Closed V2 Double
seg = Cubic v1 v1 (OffsetClosed (v1 ^+^ v2))

pathTrail :: Trail V2 Double
pathTrail = closeTrail $ fromSegments [seg]

path :: Path V2 Double
path = centerXY . scale 5 $ pathFromTrail pathTrail

makeDot :: Colour Double -> Diagram B
makeDot c = circle 1 # fc c
                     # lw 0
                     # scale 0.03

points :: Diagram B
points = mconcat [ if (isInsideWinding path p) then makeDot red # moveTo p else mempty
                 | x <- range
                 , y <- range
                 , let p = p2 (x,y)
                 ]
  where range = [-5, -4.9 .. 5]

diagram :: Diagram B
diagram = points <> stroke path # lw 0.05

main :: IO ()
main = do
  print path
  defaultMain diagram