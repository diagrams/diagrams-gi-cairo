{-# LANGUAGE NoMonomorphismRestriction #-}

module Image (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine
import Diagrams.TwoD.Image

daisyD :: Diagram B
daisyD = image (uncheckedImageRef "test/daisy-duck.png" 400 400)

daisy :: Diagram B
daisy = mconcat . take 10 . iterate (rotateBy (1/10)) . alignB $ daisyD

diagram :: Diagram B
diagram = pad 1.1 daisy

main :: IO ()
main = defaultMain diagram