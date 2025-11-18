{-# LANGUAGE NoMonomorphismRestriction #-}

module Reflect (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

d :: Diagram B
d = unitSquare <> reflectAbout (p2 (1/2,1/2)) (direction (r2 (-2,-1))) unitSquare

diagram :: Diagram B
diagram = pad 1.1 d

main :: IO ()
main = defaultMain diagram