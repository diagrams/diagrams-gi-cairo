{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

module Main where

import Test.Tasty
import Test.Tasty.Golden
import System.FilePath ((</>))
import System.Directory (createDirectoryIfMissing)

import Diagrams.Prelude
import Diagrams.Backend.Cairo

-- Import test diagrams
import qualified Opacity
import qualified Shear
import qualified NegStrut
import qualified AttrTest
import qualified Clip
import qualified RoundedRect
import qualified InfTrailTest
import qualified Issue32
import qualified Inside
import qualified Inside2
import qualified Visible
import qualified PathBoundsBug
import qualified BezParam
import qualified Adjust
import qualified Text2
import qualified Beside
import qualified Reflect
import qualified FillRule
import qualified StrutTest
import qualified PathTest
import qualified ShowNames
import qualified Explode
import qualified CmdLineTest
import qualified CatTest
import qualified Connect
import qualified Text
import qualified Test
import qualified Bounds
import qualified SetBounds
import qualified BoundsTest
import qualified Image
import qualified ImageSize
import qualified JpgTest

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = goldenTests

goldenTests :: TestTree
goldenTests = testGroup "Golden Tests"
  [ opacityTest
  , shearTest
  , negStrutTest
  , attrTest
  , clipTest
  , roundedRectTest
  , infTrailTest
  , issue32Test
  , insideTest
  , inside2Test
  , visibleTest
  , pathBoundsBugTest
  , bezParamTest
  , adjustTest
  , text2Test
  , besideTest
  , reflectTest
  , fillRuleTest
  , strutTestTest
  , pathTestTest
  , showNamesTest
  , explodeTest
  , cmdLineTestTest
  , catTestTest
  , connectTest
  , textTest
  , testTest
  , boundsTest
  , setBoundsTest
  , boundsTestTest
  , imageTest
  , imageSizeTest
  , jpgTestTest
  ]

-- Test output directory
testOutputDir :: FilePath
testOutputDir = "test" </> "test-output"

-- Golden output directory
goldenDir :: FilePath
goldenDir = "test" </> "golden-output"

-- Helper to create a golden test for a diagram
goldenDiagramTest :: String -> Diagram B -> TestTree
goldenDiagramTest name diagram =
  goldenVsFile
    name                                    -- test name
    (goldenDir </> name ++ ".png")         -- golden file
    (testOutputDir </> name ++ ".png")     -- output file
    (renderTest name diagram)              -- action to generate output

-- Render a diagram to a file for testing
renderTest :: String -> Diagram B -> IO ()
renderTest name diagram = do
  createDirectoryIfMissing True testOutputDir
  let outFile = testOutputDir </> name ++ ".png"
      sizeSpec = dims2D 400 400
  renderCairo outFile sizeSpec diagram

-- Individual test definitions (imported from test/*.hs files)

opacityTest :: TestTree
opacityTest = goldenDiagramTest "Opacity" Opacity.diagram

shearTest :: TestTree
shearTest = goldenDiagramTest "Shear" Shear.diagram

negStrutTest :: TestTree
negStrutTest = goldenDiagramTest "NegStrut" NegStrut.diagram

attrTest :: TestTree
attrTest = goldenDiagramTest "AttrTest" AttrTest.diagram

clipTest :: TestTree
clipTest = goldenDiagramTest "Clip" Clip.diagram

roundedRectTest :: TestTree
roundedRectTest = goldenDiagramTest "RoundedRect" RoundedRect.diagram

infTrailTest :: TestTree
infTrailTest = goldenDiagramTest "InfTrailTest" InfTrailTest.diagram

issue32Test :: TestTree
issue32Test = goldenDiagramTest "Issue32" Issue32.diagram

insideTest :: TestTree
insideTest = goldenDiagramTest "Inside" Inside.diagram

inside2Test :: TestTree
inside2Test = goldenDiagramTest "Inside2" Inside2.diagram

visibleTest :: TestTree
visibleTest = goldenDiagramTest "Visible" Visible.diagram

pathBoundsBugTest :: TestTree
pathBoundsBugTest = goldenDiagramTest "PathBoundsBug" PathBoundsBug.diagram

bezParamTest :: TestTree
bezParamTest = goldenDiagramTest "BezParam" BezParam.diagram

adjustTest :: TestTree
adjustTest = goldenDiagramTest "Adjust" Adjust.diagram

text2Test :: TestTree
text2Test = goldenDiagramTest "Text2" Text2.diagram

besideTest :: TestTree
besideTest = goldenDiagramTest "Beside" Beside.diagram

reflectTest :: TestTree
reflectTest = goldenDiagramTest "Reflect" Reflect.diagram

fillRuleTest :: TestTree
fillRuleTest = goldenDiagramTest "FillRule" FillRule.diagram

strutTestTest :: TestTree
strutTestTest = goldenDiagramTest "StrutTest" StrutTest.diagram

pathTestTest :: TestTree
pathTestTest = goldenDiagramTest "PathTest" PathTest.diagram

showNamesTest :: TestTree
showNamesTest = goldenDiagramTest "ShowNames" ShowNames.diagram

explodeTest :: TestTree
explodeTest = goldenDiagramTest "Explode" Explode.diagram

cmdLineTestTest :: TestTree
cmdLineTestTest = goldenDiagramTest "CmdLineTest" CmdLineTest.diagram

catTestTest :: TestTree
catTestTest = goldenDiagramTest "CatTest" CatTest.diagram

connectTest :: TestTree
connectTest = goldenDiagramTest "Connect" Connect.diagram

textTest :: TestTree
textTest = goldenDiagramTest "Text" Text.diagram

testTest :: TestTree
testTest = goldenDiagramTest "Test" Test.diagram

boundsTest :: TestTree
boundsTest = goldenDiagramTest "Bounds" Bounds.diagram

setBoundsTest :: TestTree
setBoundsTest = goldenDiagramTest "SetBounds" SetBounds.diagram

boundsTestTest :: TestTree
boundsTestTest = goldenDiagramTest "BoundsTest" BoundsTest.diagram

imageTest :: TestTree
imageTest = goldenDiagramTest "Image" Image.diagram

imageSizeTest :: TestTree
imageSizeTest = goldenDiagramTest "ImageSize" ImageSize.diagram

jpgTestTest :: TestTree
jpgTestTest = goldenDiagramTest "JpgTest" JpgTest.diagram
