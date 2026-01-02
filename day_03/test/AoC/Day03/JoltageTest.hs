module AoC.Day03.JoltageTest where

  import Test.HUnit
  import AoC.Day03.Joltage

  sampleInput = [
    [9,8,7,6,5,4,3,2,1,1,1,1,1,1,1],
    [8,1,1,1,1,1,1,1,1,1,1,1,1,1,9],
    [2,3,4,2,3,4,2,3,4,2,3,4,2,7,8],
    [8,1,8,1,8,1,9,1,1,1,1,2,1,1,1]]

  {-
  Task 1: Test with sample input.
  -}
  testTask1TaskSampleInput = TestCase (assertEqual "Task 1 sample input" 357 $ task1 sampleInput)

  {-
  Task 2: Test with sample input.
  -}
  testTask2TaskSampleInput = TestCase (assertEqual "Task 2 sample input" 3121910778619 $ task2 sampleInput)

  tests = TestList [
    TestLabel "Task 1 sample input" testTask1TaskSampleInput,
    TestLabel "Task 2 sample input" testTask2TaskSampleInput]

  run = runTestTTAndExit tests