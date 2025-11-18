{-# LANGUAGE TypeFamilies, FlexibleContexts #-}

module Beside (diagram, main) where

import Diagrams.Prelude

import Diagrams.Backend.Cairo
import Diagrams.Backend.Cairo.CmdLine

import Diagrams.TwoD.Ellipse

b :: Diagram B
b = beside (r2 (1,1)) (rotate (pi/4 @@ rad) $ scaleY 2 unitCircle) unitSquare

e1 :: Diagram B
e1 = rotate (pi/4 @@ rad) $ scaleY 2 unitCircle

e2 :: Diagram B
e2 = translateX 1 $ e1

diagram :: Diagram B
diagram = b

main :: IO ()
main = defaultMain diagram
