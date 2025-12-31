module Main where

  import Data.List.Split
  import AoC.Common
  import AoC.Day03.Joltage

  today :: Day
  today = Day { year = 2025, day = 3 }

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let batteryJoltages = parseJoltages input
    run today batteryJoltages [task1, task2]

  parseJoltages :: [String] -> GridJoltages
  parseJoltages js = 
    let
      toInt js = map (\j -> read j :: Int) js
    in
      map (toInt.(chunksOf 1)) js
