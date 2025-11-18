{-# LANGUAGE NoMonomorphismRestriction #-}

module StrutTest (diagram, main) where

import Diagrams.Prelude

import Diagrams.Backend.Cairo
import Diagrams.Backend.Cairo.CmdLine

dia :: Diagram B
dia = beside (r2 (1,0)) unitCircle (beside (r2 (1,0)) (strut (r2 (1,0))) unitCircle)

diagram :: Diagram B
diagram = dia

main :: IO ()
main = defaultMain diagram