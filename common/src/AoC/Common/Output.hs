{-|
Module      : AoC.Common.Output
Description : A set of common output functions for AoC tasks.
Stability   : experimental
-}
module AoC.Common.Output (Day(..), putResult1, putResult2) where

  data Day = Day { day :: Int, year :: Int }
  type Part = Int

  instance Show Day where
    show d = (show $ year d) ++ "-12-" ++ (show $ day d)

  {-|
  Pretty result printer for the solutions of any part of any day.
  -}
  putResult :: Show a => Part -> Day -> a -> IO ()
  putResult p d r = putStrLn $ "Solution part " ++ show p ++ " day " ++ show d ++ ": " ++ show r

  putResult1 :: Show a => Day -> a -> IO ()
  putResult1 = putResult 1

  putResult2 :: Show a => Day -> a -> IO ()
  putResult2 = putResult 2
  