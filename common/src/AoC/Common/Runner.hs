{-|
Module      : AoC.Common.Runner
Description : Abstracts the running of tasks.
Stability   : experimental
-}
module AoC.Common.Runner (run) where

  import AoC.Common.Output

  run :: Show b => Day -> a -> [(a -> b)] -> IO ()
  run d i rs = do
    let results = map (\r -> r i) rs
    putResult1 d (results!!0)
    putResult2 d (results!!1)