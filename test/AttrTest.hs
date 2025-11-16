{-# LANGUAGE NoMonomorphismRestriction #-}

module AttrTest (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

b1 :: Diagram B
b1 = square 20
--            # lc red
--            # fc blue
--            # lw 0.002  -- Removed: too thin to see, tests default lw instead

diagram :: Diagram B
diagram = pad 1.1 b1 # bg white

main :: IO ()
main = defaultMain diagram
