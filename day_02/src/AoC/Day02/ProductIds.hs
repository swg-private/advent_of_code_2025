module AoC.Day02.ProductIds (IdRange(..), task1, task2) where

  import Data.List.Split

  type IdRange = (Int, Int)
  type Id = Int
  type IdChecker = Int -> Bool

  {-
  For task 1 all ids that are twice the same number sequence count
  as made up by the elves.

  Examples: 123123, 90129012
  -}
  task1 :: [IdRange] -> Int
  task1 is = collectWrongIds checkId is
    where checkId i = let
                        idString = show i
                        idMiddle = (length idString) `div` 2
                        id = splitAt idMiddle idString
                      in
                        fst id == snd id

  {-
  For task 2 all ids with any repetition count as made up.

  Examples: 1111111, 12121212, 909909
  -}
  task2 :: [IdRange] -> Int
  task2 is = collectWrongIds checkId is
    where checkId i = let
                        idString = show i
                        idSubstrings = (length idString) `div` 2
                        checkIdParts acc ps = acc || foldl (\acc p -> acc && ps!!0 == p) True ps
                      in
                        foldl (\acc i -> checkIdParts acc (chunksOf i idString)) False [1..idSubstrings]


  collectWrongIds :: IdChecker -> [IdRange] -> Int
  collectWrongIds c is = foldl accumulateRange 0 is
    where addId acc id = if c id then acc + id else acc
          accumulateRange acc (s,e) = foldl addId acc [s..e]
