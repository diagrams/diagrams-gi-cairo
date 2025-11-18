{-# LANGUAGE NoMonomorphismRestriction #-}

module Test (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

-- Note: original test used withBounds which is deprecated
-- This simplified version just shows the base diagram

d :: Diagram B
d = unitSquare `atop` unitCircle
    # lc red
    # fc blue
    # lw 1

diagram :: Diagram B
diagram = d

main :: IO ()
main = defaultMain diagram
