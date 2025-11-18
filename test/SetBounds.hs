{-# LANGUAGE NoMonomorphismRestriction #-}

module SetBounds (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

-- Note: original test used withBounds which is deprecated
-- This simplified version shows circle beside rotated square

diagram :: Diagram B
diagram = circle 2 ||| square 1.5 # rotateBy (1/8)

main :: IO ()
main = defaultMain diagram
