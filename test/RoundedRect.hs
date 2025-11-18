{-# LANGUAGE NoMonomorphismRestriction #-}

module RoundedRect (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

import Data.Colour

d :: Diagram B
d = (roundedRect 5 2 0.3 <> regPoly 3 1)
    # lw 0.05
    # lc blue
    # fcA (green `withOpacity` 0.5)

diagram :: Diagram B
diagram = pad 1.1 d

main :: IO ()
main = defaultMain diagram