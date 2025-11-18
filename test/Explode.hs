{-# LANGUAGE NoMonomorphismRestriction #-}

module Explode (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

u :: Trail V2 Double
u = fromOffsets [r2 (0, -1)]

r :: Trail V2 Double
r = fromOffsets [r2 (1, 0)]

tr :: Trail V2 Double
tr = mconcat [u, u, r, u, r, r, r, u]

ps :: [Path V2 Double]
ps = explodeTrail (tr `at` origin)

d :: Diagram B
d = strokeT tr
    # lc red
    # centerXY

d2 :: Diagram B
d2 = ps
     # map assignColor
     # map (\(p,c) -> lc c . stroke $ p)
     # lw 1
     # centerXY
     # mconcat

assignColor :: Path V2 Double -> (Path V2 Double, Colour Double)
assignColor p | v ^. _x > 0.5 = (p,red)
              | otherwise     = (p,blue)
  where [v] = pathOffsets p

diagram :: Diagram B
diagram = pad 1.1 d2

main :: IO ()
main = defaultMain diagram