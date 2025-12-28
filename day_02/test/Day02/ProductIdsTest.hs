module Day02.ProductIdsTest where

  import Test.HUnit
  import Day02.ProductIds

  {-
  Task 1: Test with sample input.
  -}
  sampleInput = [(11, 22), (95, 115), (998, 1012), (1188511880, 1188511890), (222220, 222224), (1698522, 1698528), (446443, 446449), (38593856, 38593862)]
  testTask1TaskSampleInput = TestCase (assertEqual "Task 1 sample input" 1227775554 $ task1 sampleInput)

  tests = TestList [
    TestLabel "Task 1 sample input" testTask1TaskSampleInput]

  run = runTestTTAndExit tests