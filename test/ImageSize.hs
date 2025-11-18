{-# LANGUAGE NoMonomorphismRestriction #-}

module ImageSize (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine
import Diagrams.TwoD.Image

d :: Diagram B
d = image (uncheckedImageRef "test/daisy-duck.png" 450 450)

diagram :: Diagram B
diagram = pad 1.1 $ d

main :: IO ()
main = defaultMain diagram