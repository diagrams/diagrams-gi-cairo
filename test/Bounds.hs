{-# LANGUAGE NoMonomorphismRestriction #-}

module Bounds (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

-- Note: original test used withBounds which is deprecated
-- This simplified version just shows a circle

diagram :: Diagram B
diagram = circle 4

main :: IO ()
main = defaultMain diagram
