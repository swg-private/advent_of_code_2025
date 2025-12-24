module Day01.Dial where

  type Dial = Int
  type DialCounter = Dial -> Dial -> Rotation -> Int -> Int
  type SecretPassword = Int
  data Rotation = RotateLeft Int | RotateRight Int deriving (Show)

  task1 :: [Rotation] -> Dial -> SecretPassword
  task1 = accumulateSecretPassword dc 0
    where dc = \_ d' _ a -> if d' == 0 then a + 1 else a

  task2 :: [Rotation] -> Dial -> SecretPassword
  task2 = accumulateSecretPassword dc 0
    where dc d d' (RotateRight i) a = if d + i > 99 then a + ((d + i) `div` 100) else a
          dc d d' (RotateLeft i) a | d <= i && d' /= 0 = a + (abs ((d - i) `div` 100))
                                   | d <= i && d /= 0 && d' == 0 = a + (abs ((d - i) `div` 100)) + 1
                                   | otherwise = a

  accumulateSecretPassword :: DialCounter -> Int -> [Rotation] -> Dial -> SecretPassword
  accumulateSecretPassword dc a [] d = a
  accumulateSecretPassword dc a (r:rs) d = accumulateSecretPassword dc a' rs d'
    where d' = turn r d
          a' = dc d d' r a

  turn :: Rotation -> Dial -> Dial
  turn (RotateLeft a) d = (d - a) `mod` 100
  turn (RotateRight a) d = (d + a) `mod` 100
