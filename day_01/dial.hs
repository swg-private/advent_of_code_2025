module Main where

  type Dial = Int
  type SecretPassword = Int
  data Rotation = RotateLeft Int | RotateRight Int deriving (Show)

  main :: IO ()
  main = do
    input <- lines <$> readFile "input.txt"
    let rotations = parseRotations input
    -- Task 1
    let result1 = task1 rotations 50
    putStrLn $ show result1

  task1 :: [Rotation] -> Dial -> SecretPassword
  task1 = accumulateSecretPassword 0

  parseRotations :: [String] -> [Rotation]
  parseRotations = map parseRotation

  parseRotation :: String -> Rotation
  parseRotation ('R':xs) = RotateRight (read xs :: Int)
  parseRotation ('L':xs) = RotateLeft (read xs :: Int)

  accumulateSecretPassword :: Int -> [Rotation] -> Dial -> SecretPassword
  accumulateSecretPassword a [] d = a
  accumulateSecretPassword a (r:rs) d = accumulateSecretPassword a' rs d'
    where d' = turn r d
          a' = if d' == 0 then a + 1 else a

  turn :: Rotation -> Dial -> Dial
  turn (RotateLeft a) d = (100 + d - a) `mod` 100
  turn (RotateRight a) d = (d + a) `mod` 100
