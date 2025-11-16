{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module Issue32 (diagram, main) where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

d1 :: Diagram B
d1 = hcat' (with & sep .~ 1) [unitSquare, mempty, unitSquare # fc blue]

d1' :: Diagram B
d1' = hcat [unitSquare, strutX 1, mempty, strutX 1, unitSquare # fc red]

d2 :: Diagram B
d2 = hcat' (with & sep .~ 1) [unitSquare, unitSquare # fc green]

diagram :: Diagram B
diagram = d1 ||| strutX 2 ||| d2 ||| strutX 2 ||| d1'

main :: IO ()
main = defaultMain diagram