{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module NegStrut (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

diagram :: Diagram B
diagram = ((strutX (-1) ||| circle 1) ||| circle 1) # pad 1.1

main :: IO ()
main = defaultMain diagram