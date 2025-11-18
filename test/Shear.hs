{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module Shear (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

d :: Diagram B
d = unitSquare

diagram :: Diagram B
diagram = vcat' (with & sep .~ 2)
  [ hcat' (with & sep .~ 3) [ d, d # shearX 0.3, d # shearX 0.6 ]
  , hcat' (with & sep .~ 3) [ d # shearY 0.5, d # shearY 0.5 # shearX 0.3
                            , d # shearY 0.5 # shearX 0.6 ]
  ]
  # pad 1.1

main :: IO ()
main = defaultMain diagram