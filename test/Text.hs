{-# LANGUAGE NoMonomorphismRestriction #-}

module Text (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

t :: Diagram B
t = text "Yay, text!"
    # font "dejavu lgc serif"
    # italic
    # bold

d :: Diagram B
d =  t
  <> rect 15 3 # lw 0 # showOrigin

-- Create text at different sizes, manually positioned
d2 :: Diagram B
d2 = vcat
  [ text "Yay, text!" # font "dejavu lgc serif" # italic # bold # fontSize sz
  | sz <- [1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3]
  ]

diagram :: Diagram B
diagram = d === d2

main :: IO ()
main = defaultMain diagram
