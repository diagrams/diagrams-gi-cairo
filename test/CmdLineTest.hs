{-# LANGUAGE NoMonomorphismRestriction #-}

module CmdLineTest (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

d :: Diagram B
d = regPoly 5 1

d2 :: Diagram B
d2 = regPoly 17 1

diagram :: Diagram B
diagram = d ||| strutX 0.5 ||| d2

main :: IO ()
main = defaultMain diagram
