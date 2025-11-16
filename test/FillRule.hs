{-# LANGUAGE NoMonomorphismRestriction #-}

module FillRule (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

path :: Trail V2 Double
path = closeTrail . fromOffsets $ [r2 (0,10), r2 (3,0), r2 (0, -8), r2 (2,0), r2 (0,2), r2 (-4,0), r2 (0, 3)
                                  ,r2 (9, 0), r2 (0, -7)]

d :: Diagram B
d = stroke path
  # fc red
  # lw 0.05
  # fillRule EvenOdd

diagram :: Diagram B
diagram = pad 1.1 d

main :: IO ()
main = defaultMain diagram