module AoC.Day03.Joltage (GridJoltages(..), task1, task2) where

  type BatteryJoltage = Int
  type BankJoltages = [BatteryJoltage]
  type GridJoltages = [BankJoltages]
  type SelectedBankJoltage = (BatteryJoltage, BatteryJoltage)

  {-
  In task 1 we want to enable two batteries per bank
  -}
  task1 :: GridJoltages -> Int
  task1 js = 0

  task2 :: GridJoltages -> Int
  task2 js = 0
