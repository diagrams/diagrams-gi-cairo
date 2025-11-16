{-# LANGUAGE NoMonomorphismRestriction #-}

module PathTest (diagram, main) where

import Diagrams.Prelude

import Diagrams.Backend.Cairo.CmdLine

p :: Trail V2 Double
p = fromOffsets [r2 (1,2), r2 (1,-5)]

burst :: Int -> Trail V2 Double
burst n = closeTrail . mconcat . take n . iterate (rotateBy (-1/(fromIntegral n))) $ p

sun :: Diagram B
sun = (strokeT $ burst 25)
      # lineJoin LineJoinRound
      # fc yellow
      # lc red
      # lw 1
      # centerXY

dia :: Diagram B
dia = mconcat . reverse . take 15 . iterate (scale 0.8) $ sun

diagram :: Diagram B
diagram = pad 1.1 dia

main :: IO ()
main = defaultMain diagram