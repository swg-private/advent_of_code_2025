# Advent of Code 2025

## Solutions

Solutions for the following days exist in the following languages:

| Day | Task 1 | Task 2 |
|---|---|---|
| 1 | Haskell | Haskell |
| 2 | Haskell | Haskell |
| 3 | Haskell | Haskell |
| 4 | - | - |

## How do I run the solutions?

The solutions of this year are (so far) all implemented in [Haskell](https://www.haskell.org/). 
Previous years also included solutions implemented in Perl, I might also add solutions in C.

All days are separate [cabal](https://www.haskell.org/cabal/) project, and every day has a basic test
suite with at least the sample input for each task.

A given day can be run from within the day's folder like this:

```bash
$ cabal run
```

The unit tests are implemented using [HUnit](https://hackage.haskell.org/package/HUnit). 
The test suite can be run with the following command:

```bash
$ cabal test
```

For convenience my puzzle input is also checked in as `input.txt`, but it will most likely
differ from yours. Third party libraries are used where appropriate.

## Links

- [Advent of Code 2025](https://adventofcode.com/2025)
