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

  type BatteryJoltage = Int
  type BankJoltages = [BatteryJoltage]
  type GridJoltages = [BankJoltages]

  {-|
  In task 1 we want to enable two batteries per bank.
  -}
  task1 :: GridJoltages -> Int
  task1 js = foldr bankJoltage 0 js
    where
      accumulateBestJoltages i (0,0) = (0,i)
      accumulateBestJoltages i (t,o) 
        | i >= t && t > o = (i,t)
        | i >= t && t <= o = (i,o)
        | otherwise = (t,o)
      selectBankJoltage bs = foldr accumulateBestJoltages (0,0) bs
      bankJoltage bs acc = acc + ((fst $ selectBankJoltage bs) * 10) + (snd $ selectBankJoltage bs)

  {-|
  In task 2 we want to enable 12 batteries per bank.
  -}
  task2 :: GridJoltages -> Int
  task2 js = 0
