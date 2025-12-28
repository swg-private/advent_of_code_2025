module Main where

  import Data.List.Split
  import Day02.ProductIds

  main :: IO ()
  main = do
    input <- readFile "input.txt"
    let idRanges = parseIdRanges input
    -- Task 1
    let result1 = task1 idRanges
    putStrLn $ show result1

  parseIdRanges :: String -> [IdRange]
  parseIdRanges i = let
      toIdRange (x:y:[]) = (read x :: Int, read y :: Int)
    in
      map (toIdRange.(splitOn "-")) $ splitOn "," i
