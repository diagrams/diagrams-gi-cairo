{-# LANGUAGE NoMonomorphismRestriction #-}

module Connect (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

dotDiagram :: Diagram B
dotDiagram = circle 0.1
      # lw 0 # fc black

-- Place dots at vertices of an octagon
placeDots :: Int -> Diagram B
placeDots n = mconcat
  [ dotDiagram # named i # moveTo (p2 (cos θ, sin θ))
  | i <- [0..n-1]
  , let θ = fromIntegral i * 2 * pi / fromIntegral n
  ]

-- Connect two named dots
connectDots :: Int -> Int -> Diagram B -> Diagram B
connectDots i j = withName i $ \p1 ->
                  withName j $ \p2 ->
                    atop (location p1 ~~ location p2)

d :: Diagram B
d = placeDots 8
    # connectDots 0 2
    # connectDots 2 5
    # connectDots 5 6
    # connectDots 6 3
    # connectDots 3 7

diagram :: Diagram B
diagram = pad 1.1 (d # centerXY)

main :: IO ()
main = defaultMain diagram
