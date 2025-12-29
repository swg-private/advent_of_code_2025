module AoC.Day02.ProductIds (IdRange(..), task1) where

  type IdRange = (Int, Int)
  type Id = Int

  task1 :: [IdRange] -> Int
  task1 is = foldl accumulateRange 0 is
    where addId acc id = if checkId id then acc + id else acc
          accumulateRange acc (s,e) = foldl addId acc [s..e]

  checkId :: Id -> Bool
  checkId i = let
                idString = show i
                idMiddle = (length idString) `div` 2
                id = splitAt idMiddle idString
              in
                fst id == snd id
