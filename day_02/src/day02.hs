module Main where

  import Data.List.Split
  import AoC.Common.Output
  import AoC.Day02.ProductIds

  today :: Day
  today = Day { year = 2025, day = 2 }

  main :: IO ()
  main = do
    input <- readFile "input.txt"
    let idRanges = parseIdRanges input
    -- Task 1
    let result1 = task1 idRanges
    putResult1 today result1
    -- Task 2
    let result2 = task2 idRanges
    putResult2 today result2

  parseIdRanges :: String -> [IdRange]
  parseIdRanges i = let
                      toIdRange (x:y:[]) = (read x :: Int, read y :: Int)
                    in
                      map (toIdRange.(splitOn "-")) $ splitOn "," i
