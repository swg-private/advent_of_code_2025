module Main where

  import Data.List.Split
  import AoC.Common
  import AoC.Day02.ProductIds

  today :: Day
  today = Day { year = 2025, day = 2 }

  main :: IO ()
  main = do
    input <- readFile "input.txt"
    let idRanges = parseIdRanges input
    run today idRanges [task1, task2]

  parseIdRanges :: String -> [IdRange]
  parseIdRanges i = 
    let
      toIdRange (x:y:[]) = (read x :: Int, read y :: Int)
    in
      map (toIdRange.(splitOn "-")) $ splitOn "," i
