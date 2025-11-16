{-# LANGUAGE NoMonomorphismRestriction #-}

module ShowNames (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

diagram :: Diagram B
diagram = hcat (replicate 10 (circle 2 # named "foo" :: Diagram B)) # showLabels

main :: IO ()
main = defaultMain diagram