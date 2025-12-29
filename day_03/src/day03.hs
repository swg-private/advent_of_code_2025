module Main where

  import Data.List.Split
  import AoC.Common.Output
  import AoC.Day03.Joltage

  today :: Day
  today = Day { year = 2025, day = 3 }

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let batteryJoltages = parseJoltages input
    -- Task 1
    let result1 = task1 batteryJoltages
    putResult1 today result1
    -- Task 2
    let result2 = task2 batteryJoltages
    putResult2 today result2

  parseJoltages :: [String] -> GridJoltages
  parseJoltages js = let
                       toInt js = map (\j -> read j :: Int) js
                     in
                       map (toInt.(chunksOf 1)) js
