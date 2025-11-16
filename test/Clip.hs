{-# LANGUAGE NoMonomorphismRestriction #-}

module Clip (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

d :: Diagram B
d = unitSquare
    # fc red
    # clipBy clipPath

clipPath :: Path V2 Double
clipPath = polygon (def & polyType .~ PolyRegular 4 1) # scale (1/sqrt 2)

diagram :: Diagram B
diagram = pad 1.1 d

main :: IO ()
main = defaultMain diagram