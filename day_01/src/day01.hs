module Main where

  import Day01.Dial

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let rotations = parseRotations input
    -- Task 1
    let result1 = task1 rotations 50
    putStrLn $ show result1
    -- Task 2
    let result2 = task2 rotations 50
    putStrLn $ show result2

  parseRotations :: [String] -> [Rotation]
  parseRotations = map parseRotation

  parseRotation :: String -> Rotation
  parseRotation ('R':xs) = RotateRight (read xs :: Int)
  parseRotation ('L':xs) = RotateLeft (read xs :: Int)
