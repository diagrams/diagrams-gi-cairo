{-# LANGUAGE NoMonomorphismRestriction #-}

module CatTest (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

import Data.Colour.Names

myColors :: [Colour Double]
myColors = cycle [ aqua
                 , aquamarine
                 , blue
                 , blueviolet
                 , cadetblue
                 , cyan
                 , cornflowerblue
                 , darkblue
                 , darkcyan
                 ]

circles :: [Diagram B]
circles = map (lw 0) $
  zipWith3 (\c s d -> d # fc c # scale s) myColors [1..10] (repeat unitCircle)

foo1 :: Diagram B
foo1 = cat (r2 (1,-0.5)) circles

foo2 :: Diagram B
foo2 = cat unitX $ map alignT circles

foo3 :: Diagram B
foo3 = cat unitX $ map alignB circles

-- Note: removed bar with decorateTrail as that API is deprecated

diagram :: Diagram B
diagram = cat (negated unitY) (map (showOrigin . centerX) [foo1, foo2, foo3])

main :: IO ()
main = defaultMain diagram
