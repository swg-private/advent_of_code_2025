module Main where

  import qualified Data.Vector as V
  import AoC.Common
  import AoC.Day04.PaperRolls

  today :: Day
  today = Day { year = 2025, day = 4 }

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let warehouse = parseWarehouse input
    run today warehouse [task1, task2]

  parseWarehouse :: [String] -> PaperRollWarehouse
  parseWarehouse ls = V.fromList (map V.fromList ls)
