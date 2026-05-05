{-|
Module      : AoC.Day04.PaperRolls
Description : The printing on huge rolls of paper needs to get going.
Stability   : experimental

The printing is getting delayed by a jammed hall with rolls of paper.
The rolls are shown as at-symbols.

>..@@.@@@@.
>@@@.@.@.@@
>@@@@@.@.@@
>@.@@@@..@.
>@@.@@@@.@@
>.@@@@@@@.@
>.@.@.@.@@@
>@.@@@.@@@@
>.@@@@@@@@.
>@.@.@@@.@.

Only paper rolls with less than 4 direct neighbours can be moved by a
forklift.

For the full task see [Advent of Code](https://adventofcode.com/2025/day/4).
-}
module AoC.Day04.PaperRolls (PaperRollWarehouse(..), task1, task2) where

  import Control.Monad.State
  import qualified Data.Vector as V
  import Data.Maybe (catMaybes)

  type PaperRollWarehouse = V.Vector (V.Vector Char)
  type Position = (Int, Int)

  {-|
  In task 1 we want to find all rolls initially accessible.
  -}
  task1 :: PaperRollWarehouse -> Int
  task1 a = checkWarehouse a 4

  {-|
  In task 2 we want to iteratively count and remove the accessible paper rolls.
  -}
  task2 :: PaperRollWarehouse -> Int
  task2 a = countPaperRolls a - countPaperRolls (clearWarehouse a 4)
    where
      countPaperRolls :: PaperRollWarehouse -> Int
      countPaperRolls w = V.sum $ V.map (length . V.filter (== '@')) w

  clearWarehouse :: PaperRollWarehouse -> Int -> PaperRollWarehouse
  clearWarehouse a t = execState cw a
    where
      cw :: State PaperRollWarehouse ()
      cw = do
        w <- get
        put cw w
        return ()

  checkWarehouse :: PaperRollWarehouse -> Int -> Int
  checkWarehouse warehouse t = length [(x, y) | x <- [0..V.length warehouse - 1], y <- [0..V.length (warehouse V.! 0) - 1], isAccessible warehouse (x, y) t]

  isAccessible :: PaperRollWarehouse -> Position -> Int -> Bool
  isAccessible warehouse (x, y) threshold =
    ((warehouse V.! x) V.! y == '@') && (countNeighbours warehouse (x, y) < threshold)

  countNeighbours :: PaperRollWarehouse -> Position -> Int
  countNeighbours warehouse (x, y) = length $ filter (== '@') $ catMaybes neighbours
    where
      neighbours = [ getNeighbour warehouse x (y-1)
                   , getNeighbour warehouse x (y+1)
                   , getNeighbour warehouse (x-1) y
                   , getNeighbour warehouse (x+1) y
                   , getNeighbour warehouse (x-1) (y+1)
                   , getNeighbour warehouse (x+1) (y+1)
                   , getNeighbour warehouse (x-1) (y-1)
                   , getNeighbour warehouse (x+1) (y-1)
                   ]

  getNeighbour :: PaperRollWarehouse -> Int -> Int -> Maybe Char
  getNeighbour warehouse x y = do
    row <- warehouse V.!? x
    row V.!? y
