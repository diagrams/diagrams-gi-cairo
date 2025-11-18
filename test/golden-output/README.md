# Golden Test Output

This directory contains reference images for golden tests. These images serve as the "known good" output that test results are compared against.

## Test Methodology

The test suite uses **golden tests** (also known as characterization tests or approval tests):

1. Each test renders a diagram to a PNG file
2. The output is compared byte-for-byte with the corresponding golden image
3. If the files match, the test passes
4. If they differ, the test fails and shows a diff

## Running Tests

```bash
# Run all golden tests
cabal test

# Update golden files after intentional changes
cabal test --test-options=--accept
```

## Current Golden Tests

### Passing Tests

- **Opacity.png** - Tests opacity/transparency with overlapping shapes (circle + square)
- **Shear.png** - Tests shear transformations on shapes (multiple shear operations)
- **NegStrut.png** - Tests negative struts for layout (circles with negative spacing)

### Tests Needing API Updates

Many tests in the `test/` directory use deprecated diagrams APIs and need updates:

- **PathTest.hs** - Uses deprecated `AnnDiagram` type
- **Reflect.hs** - Type errors with reflection API
- **Visible.hs** - API compatibility issues
- **StrutTest.hs** - Type errors
- **SetBounds.hs** - API compatibility issues
- **RoundedRect.hs** - Uses old `with` record syntax
- **Text.hs** - Uses deprecated `decorateTrail`

## Adding New Golden Tests

To add a new golden test:

1. Add the test definition to `test/Suite.hs`
2. Run `cabal test --test-options=--accept` to generate the initial golden image
3. Visually verify the golden image looks correct
4. Commit both the test code and the golden image

## Regenerating Golden Images

If you make intentional changes to rendering:

```bash
# Review the visual changes first
cabal test  # This will fail and show differences

# If changes look correct, accept them
cabal test --test-options=--accept

# Commit the updated golden images
git add test/golden-output/*.png
git commit -m "Update golden images after rendering changes"
```

## Why Golden Tests?

Golden tests are particularly useful for:
- **Graphics libraries** where visual correctness is paramount
- **Regression detection** - catch unintended rendering changes
- **Automated CI** - tests can run without manual inspection
- **Documentation** - golden images serve as visual documentation

Unlike property-based or unit tests, golden tests don't assert specific properties - they simply ensure output hasn't changed from a known reference.
