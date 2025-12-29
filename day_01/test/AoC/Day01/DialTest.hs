module AoC.Day01.DialTest where

  import Test.HUnit
  import AoC.Day01.Dial

  {-
  Tests that turn the dial to zero either clockwise or counterclockwise and turn the dial in either direction by 150.
  Expected output is 2 in all cases.
  -}
  testTask2DialToZero150TwiceRight = TestCase (assertEqual "Right 50 and 150" 2 $ task2 [RotateRight 50, RotateRight 150] 50)
  testTask2DialToZero150TwiceLeft = TestCase (assertEqual "Left 50 and 150" 2 $ task2 [RotateLeft 50, RotateLeft 150] 50)
  testTask2DialToZero150TwiceLeftRight = TestCase (assertEqual "Left 50 and right 150" 2 $ task2 [RotateLeft 50, RotateRight 150] 50)
  testTask2DialToZero150TwiceRightLeft = TestCase (assertEqual "Right 50 and left 150" 2 $ task2 [RotateRight 50, RotateLeft 150] 50)

  {-
  Test that dials to zero and away get counted correctly. Expected output is always 1.
  -}
  testTask2DialToZero50TwiceRight = TestCase (assertEqual "Right 50 and 50" 1 $ task2 [RotateRight 50, RotateRight 50] 50)
  testTask2DialToZero50TwiceLeft = TestCase (assertEqual "Left 50 and 50" 1 $ task2 [RotateLeft 50, RotateLeft 50] 50)
  testTask2DialToZero50TwiceLeftRight = TestCase (assertEqual "Left 50 and right 50" 1 $ task2 [RotateLeft 50, RotateRight 50] 50)
  testTask2DialToZero50TwiceRightLeft = TestCase (assertEqual "Right 50 and left 50" 1 $ task2 [RotateRight 50, RotateLeft 50] 50)

  {-
  Test that moves that end in 0 and do not turn the dial more than once get counted.
  -}
  testTask2DialToZeroLeft = TestCase (assertEqual "Left by 50" 1 $ task2 [RotateLeft 50] 50)

  {-
  Test the example input from the task description.
  -}
  sampleInput = [RotateLeft 68, RotateLeft 30, RotateRight 48, RotateLeft 5, RotateRight 60, RotateLeft 55, RotateLeft 1, RotateLeft 99, RotateRight 14, RotateLeft 82]
  testTask2TaskSampleInput = TestCase (assertEqual "Task sample input" 6 $ task2 sampleInput 50)
  testTask2SampleSupplementary = TestCase (assertEqual "Sample supplementary" 10 $ task2 [RotateRight 1000] 50)

  tests = TestList [
    TestLabel "Set dial to right zero and turn right more than once" testTask2DialToZero150TwiceRight,
    TestLabel "Set dial to left zero and turn left more than once" testTask2DialToZero150TwiceLeft,
    TestLabel "Set dial to left zero and turn right more than once" testTask2DialToZero150TwiceLeftRight,
    TestLabel "Set dial to right zero and turn left more than once" testTask2DialToZero150TwiceRightLeft,
    TestLabel "Set dial to right zero and turn back right" testTask2DialToZero50TwiceRight,
    TestLabel "Set dial to left zero and turn back left" testTask2DialToZero50TwiceLeft,
    TestLabel "Set dial to left zero and turn back right" testTask2DialToZero50TwiceLeftRight,
    TestLabel "Set dial to right zero and turn back left" testTask2DialToZero50TwiceRightLeft,
    TestLabel "Dial back to zero from 50 to the left" testTask2DialToZeroLeft,
    TestLabel "Task sample input" testTask2TaskSampleInput,
    TestLabel "Task 2 sample supplementary" testTask2SampleSupplementary]

  run = runTestTTAndExit tests
