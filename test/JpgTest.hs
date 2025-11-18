{-# LANGUAGE NoMonomorphismRestriction #-}

module JpgTest (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine
import Diagrams.TwoD.Image

diagram :: Diagram B
diagram = image (uncheckedImageRef "test/phone.jpg" 470 377)

main :: IO ()
main = defaultMain diagram