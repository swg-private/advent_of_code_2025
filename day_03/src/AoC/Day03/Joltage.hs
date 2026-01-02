{-|
Module      : AoC.Day03.Joltage
Description : We need to enable batteries to get the escalators going.
Stability   : experimental

The escalators are not working. Emergency power can be turned on by
a set of banks of individual batteries.

@
XXXXXX < bank of six individual batteries
123456
Y54321
^
Y = individual battery
@

The total j(v)oltage supplied by a bank of batteries is given as a
concatenation of the j(v)oltage ratings of the individual batteries
from left to right. The amount of batteries to turn on in each bank
varies from task 1 to task 2.

For the full task see [Advent of Code](https://adventofcode.com/2025/day/3).
-}
module AoC.Day03.Joltage (GridJoltages(..), task1, task2) where

  type BankSize = Int
  type Joltage = Int
  type BankJoltages = [Joltage]
  type GridJoltages = [BankJoltages]

  {-|
  In task 1 we want to enable two batteries per bank.
  -}
  task1 :: GridJoltages -> Joltage
  task1 = totalJoltage 2

  {-|
  In task 2 we want to enable 12 batteries per bank.
  -}
  task2 :: GridJoltages -> Joltage
  task2 = totalJoltage 12

  totalJoltage :: BankSize -> GridJoltages -> Joltage
  totalJoltage size js = foldr bankJoltage 0 js
    where 
      accumulateBestJoltages _ _ 0 = []
      accumulateBestJoltages bs s len = 
        let
          idx = foldl (\acc b -> if bs!!b > bs!!acc then b else acc) s [s..(length bs - len)]
        in
          [bs!!idx] ++ (accumulateBestJoltages bs (idx+1) (len-1))
      selectBankJoltage bs = accumulateBestJoltages bs 0 size
      bankJoltage bs acc = acc + (fst (foldr (\j (sum,exp) -> (sum + j*10^exp, exp+1)) (0,0) (selectBankJoltage bs)))
