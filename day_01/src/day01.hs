module Main where

  import AoC.Common.Output
  import AoC.Day01.Dial

  today :: Day
  today = Day { year = 2025, day = 1 }

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let rotations = parseRotations input
    -- Task 1
    let result1 = task1 rotations 50
    putResult1 today result1
    -- Task 2
    let result2 = task2 rotations 50
    putResult2 today result2

  parseRotations :: [String] -> [Rotation]
  parseRotations = map parseRotation

  parseRotation :: String -> Rotation
  parseRotation ('R':xs) = RotateRight (read xs :: Int)
  parseRotation ('L':xs) = RotateLeft (read xs :: Int)
