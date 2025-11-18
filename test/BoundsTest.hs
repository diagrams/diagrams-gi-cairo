{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module BoundsTest (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine
import Diagrams.Core.Envelope (appEnvelope)

p, bez, ell :: Diagram B
p = stroke (fromOffsets [r2 (1.0,0.0), r2 (0.0,1.0)] :: Trail V2 Double)
bez = stroke (fromSegments [bezier3 (r2 (1.0,0.0)) (r2 (0.0,1.0)) (r2 (1.0,1.0))] :: Trail V2 Double)
ell = scaleX 2 $ scaleY 0.5 unitCircle

t :: Trail V2 Double
t = polygon (def & polyType .~ PolyRegular 3 1 & polyOrient .~ OrientTo unitX)

v1, v2 :: V2 Double
(v1:v2:_) = trailOffsets t

s :: Trail V2 Double
s = fromSegments [Cubic v1 v1 (OffsetClosed (v1 ^+^ v2))]

s1 :: Diagram B
s1 = (strokeT $ s)
   # centerXY

s2 :: Diagram B
s2 = (strokeT $ s <> (rotateBy (1/3) s))
   # centerXY

s3 :: Diagram B
s3 = (strokeT $ s <> (rotateBy (1/3) s) <> (rotateBy (2/3) s))
   # centerXY

str :: Diagram B
str = strokeT $ fromOffsets [r2 (1,0)]

-- Radial envelope sampling with dots at boundary points
-- Uses dots instead of lines since circles render correctly
sampleBounds2D :: Int -> Diagram B -> Diagram B
sampleBounds2D n d = case appEnvelope (getEnvelope d) :: Maybe (V2 Double -> Double) of
  Nothing -> d  -- empty envelope, just show the diagram
  Just envFunc -> (d # lc red) <> mconcat sampleDots
    where
      -- Generate n evenly-spaced direction vectors around a circle
      angles = [fromIntegral i * 2 * pi / fromIntegral n | i <- [0..n-1]]
      directions = [r2 (cos a, sin a) | a <- angles]

      -- For each direction, query the envelope and place a dot
      sampleDots = [mkSampleDot v (envFunc v) | v <- directions]

      -- Create a line segment from the boundary point, perpendicular to direction
      mkSampleDot :: V2 Double -> Double -> Diagram B
      mkSampleDot v dist =
        let boundaryPt = p2 (x, y) where V2 x y = dist *^ v
            perpVec = perp v ^* 0.15  -- Perpendicular line extending outward
            -- Create a line centered at origin, then move it to boundary point
            lineSegment = fromOffsets [perpVec] :: Trail V2 Double
        in stroke lineSegment # lw 1 # lc white # moveTo boundaryPt

      perp :: V2 Double -> V2 Double
      perp (V2 x y) = V2 (-y) x

runBoundsTest :: Diagram B -> Diagram B
runBoundsTest = sampleBounds2D 100

b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18 :: Diagram B
b1 = runBoundsTest $ square 1
b2 = runBoundsTest $ circle 1
b3 = runBoundsTest p
b4 = runBoundsTest bez
b5 = runBoundsTest ell
b6 = runBoundsTest $ square 2
b7 = runBoundsTest $ circle 2
b8 = runBoundsTest (scale 2 p)
b9 = runBoundsTest (scale 2 bez)
b10 = runBoundsTest (scale 2 ell)
b11 = runBoundsTest (rotate (pi/6 @@ rad) unitSquare)
b12 = runBoundsTest (scaleX 3 $ scaleY 2 $ bez)
b13 = runBoundsTest (translate (r2 (1,0)) unitSquare)
b14 = runBoundsTest (rotate (2*pi/3 @@ rad) ell)
b15 = runBoundsTest s1
b16 = runBoundsTest s2
b17 = runBoundsTest s3
b18 = runBoundsTest str

diagram :: Diagram B
diagram = vcat' (with & sep .~ 0.5)
  [ hcat' (with & sep .~ 0.5) [b1, b2, b3, b4, b5, b6]
  , hcat' (with & sep .~ 0.5) [b7, b8, b9, b10, b11, b12]
  , hcat' (with & sep .~ 0.5) [b13, b14, b15, b16, b17, b18]
  ]
  # pad 1.1
  # bg black

main :: IO ()
main = defaultMain diagram
