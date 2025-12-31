module Main where

  import AoC.Common
  import AoC.Day01.Dial

  today :: Day
  today = Day { year = 2025, day = 1 }

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let rotations = parseRotations input
    run today rotations [task1, task2]

  parseRotations :: [String] -> [Rotation]
  parseRotations = map parseRotation
    where
      parseRotation ('R':xs) = RotateRight (read xs :: Int)
      parseRotation ('L':xs) = RotateLeft (read xs :: Int)
