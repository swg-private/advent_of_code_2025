module Day02.ProductIds where

  type IdRange = (Int, Int)
  type Id = Int

  task1 :: [IdRange] -> Int
  task1 x = if checkId (fst $ x!!0) then 1 else 0

  checkId :: Id -> Bool
  checkId i = let
      idString = show i
      idMiddle = (length idString) `div` 2
      id = splitAt idMiddle idString
    in
      fst id == snd id
