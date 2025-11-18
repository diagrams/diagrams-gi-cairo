{-# LANGUAGE NoMonomorphismRestriction #-}

module Opacity (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

d :: Diagram B
d = (unitCircle # lc green # fc blue) <> (unitSquare # fc red)

diagram :: Diagram B
diagram = d # opacity 0.8 # opacity 0.8 # opacity 0.8 # opacity 0.6 # pad 1.1

main :: IO ()
main = defaultMain diagram