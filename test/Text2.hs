{-# LANGUAGE NoMonomorphismRestriction #-}

module Text2 (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

letterBlock :: Char -> Diagram B
letterBlock c = square 1.5 <> text [c]

diagram :: Diagram B
diagram = hcat $ map letterBlock ['a'..'z']

main :: IO ()
main = defaultMain diagram