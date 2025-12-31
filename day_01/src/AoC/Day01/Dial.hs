{-|
Module      : AoC.Day01.Dial
Description : Open the door to the base with a dial.
Stability   : experimental

On day 1 we need to open the door to the secret base on the north
pole with a dial. Which combinations we need to add up to get the
secret password is different in each task.

For the full task see [Advent of Code](https://adventofcode.com/2025/day/1).
-}
module AoC.Day01.Dial (Rotation(..), task1, task2) where

  type Dial = Int
  type DialCounter = Dial -> Dial -> Rotation -> Int -> Int
  type SecretPassword = Int
  data Rotation = RotateLeft Int | RotateRight Int deriving (Show)

  {-|
  For task 1 we count every time the dial ends on the 0.
  -}
  task1 :: [Rotation] -> SecretPassword
  task1 = accumulateSecretPassword dc 0 50
    where 
      dc = \_ d' _ a -> if d' == 0 then a + 1 else a

  {-|
  In task 2 we count each time the dial passes or ends up on the 0.
  Hence: Starting at 50 a R150 would count 2, L149 would count only 1.
  -}
  task2 :: [Rotation] -> SecretPassword
  task2 = accumulateSecretPassword dc 0 50
    where 
      dc d d' (RotateRight i) a = if d + i > 99 then a + ((d + i) `div` 100) else a
      dc d d' (RotateLeft i) a = a + fullRotations + additionalCrossing
        where
          fullRotations = i `div` 100
          partialRotation = i `mod` 100
          additionalCrossing = if partialRotation >= d && d /= 0 then 1 else 0

  {-|
  We count on the accumulator only if the DialCounter function decides that it needs to.
  The DialCounter is passed in and represents the rules of counting stated in the task.
  -}
  accumulateSecretPassword :: DialCounter -> Int -> Dial -> [Rotation]  -> SecretPassword
  accumulateSecretPassword dc a d [] = a
  accumulateSecretPassword dc a d (r:rs) = accumulateSecretPassword dc a' d' rs
    where 
      d' = turn r d
      a' = dc d d' r a

  turn :: Rotation -> Dial -> Dial
  turn (RotateLeft a) d = (d - a) `mod` 100
  turn (RotateRight a) d = (d + a) `mod` 100
