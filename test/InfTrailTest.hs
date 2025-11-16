{-# LANGUAGE FlexibleContexts #-}

module InfTrailTest (diagram, main) where

import Diagrams.Prelude

import Diagrams.Backend.Cairo.CmdLine

t :: Diagram B
t = regPoly 3 1 # scale 10 # fc white # lc black # lw 0.2

ts :: Diagram B
ts = cat' (r2 (10,2)) (with & catMethod .~ Distrib & sep .~ 1) (replicate 6 t)

diagram :: Diagram B
diagram = ts

main :: IO ()
main = defaultMain diagram