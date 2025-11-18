{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module Visible (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

grid :: Int -> Diagram B
grid n = centerXY
       . cat' unitY (with & sep .~ 1 & catMethod .~ Distrib)
       . map (hcat' (with & sep .~ 1 & catMethod .~ Distrib)) $
  (map . map) (lw 0 . applyColor) [ [(r,c) | c <- [0..n] ] |  r <- [0..n]]

applyColor :: (Int, Int) -> Diagram B
applyColor (0,0) = unitSquare # fc black
applyColor (m,n) | gcd m n == 1 = unitSquare # fc yellow
                 | otherwise    = unitSquare # fc black

diagram :: Diagram B
diagram = pad 1.1 $ grid 50

main :: IO ()
main = defaultMain diagram