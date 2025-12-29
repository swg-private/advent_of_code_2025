module AoC.Day02.ProductIdsTest where

  import Test.HUnit
  import AoC.Day02.ProductIds

  sampleInput = [(11, 22), (95, 115), (998, 1012), (1188511880, 1188511890), (222220, 222224), (1698522, 1698528), (446443, 446449), (38593856, 38593862), (565653, 565659), (824824821, 824824827), (2121212118, 2121212124)]

  {-
  Task 1: Test with sample input.
  -}
  testTask1TaskSampleInput = TestCase (assertEqual "Task 1 sample input" 1227775554 $ task1 sampleInput)

  {-
  Task 2: Test with sample input.
  -}
  testTask2TaskSampleInput = TestCase (assertEqual "Task 2 sample input" 4174379265 $ task2 sampleInput)

  tests = TestList [
    TestLabel "Task 1 sample input" testTask1TaskSampleInput,
    TestLabel "Task 2 sample input" testTask2TaskSampleInput]

  run = runTestTTAndExit tests