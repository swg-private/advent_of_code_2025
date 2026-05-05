module AoC.Day04.PaperRollsTest where

  import qualified Data.Vector as V
  import Test.HUnit
  import AoC.Day04.PaperRolls

  sampleInput = V.fromList [
    V.fromList "..@@.@@@@.",
    V.fromList "@@@.@.@.@@",
    V.fromList "@@@@@.@.@@",
    V.fromList "@.@@@@..@.",
    V.fromList "@@.@@@@.@@",
    V.fromList ".@@@@@@@.@",
    V.fromList ".@.@.@.@@@",
    V.fromList "@.@@@.@@@@",
    V.fromList ".@@@@@@@@.",
    V.fromList "@.@.@@@.@."]

  cornerInput = V.fromList [
    V.fromList "@.",
    V.fromList ".."]

  {-
  Task 1: Test with sample input.
  -}
  testTask1TaskSampleInput = TestCase (assertEqual "Task 1 sample input" 13 $ task1 sampleInput)
  testTask1CornerInput = TestCase (assertEqual "Task 1 corner top left" 1 $ task1 cornerInput)

  {-
  Task 2: Test with sample input.
  -}
  testTask2TaskSampleInput = TestCase (assertEqual "Task 2 sample input" 43 $ task2 sampleInput)

  tests = TestList [
    TestLabel "Task 1 sample input" testTask1TaskSampleInput,
    TestLabel "Task 1 with simple corner top left" testTask1CornerInput,
    TestLabel "Task 2 sample input" testTask2TaskSampleInput]

  run = runTestTTAndExit tests