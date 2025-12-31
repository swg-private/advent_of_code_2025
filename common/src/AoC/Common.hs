{-|
Module      : AoC.Common
Description : A set of common functions to use in the daily tasks.
Stability   : experimental

= Output

@AoC.Common.Output@ includes helper functions to print pretty answers
to the terminal. This module is mainly used for the runner, but also
exports the type @Day@.

@
  today = Day { year = 2025, day = 31 }
@

= Runner

@AoC.Common.Runner@ has a function that runs the tasks given the day's
input and prints the results to the console.

@
  run today input [task1, task2]
@
-}
module AoC.Common (module AoC.Common.Output, module AoC.Common.Runner) where

  import AoC.Common.Output
  import AoC.Common.Runner
