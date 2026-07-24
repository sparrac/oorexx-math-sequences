#!/usr/bin/env rexx

suite = .TestSuite~new(.TestArithmeticSequence)

result = .TestResult~new
formatter = .SimpleConsoleFormatter~new(result)

suite~execute(result)

formatter~print

::requires "OOREXXUNIT.CLS"
::requires "../Math/Sequences"

::class 'TestArithmeticSequence' subclass TestCase public

::method testTerm
  s = .ArithmeticSequence~new(2, 3)

  self~assertEquals(2,  s[1])
  self~assertEquals(5,  s[2])
  self~assertEquals(8,  s[3])
  self~assertEquals(29, s[10])

::method testSum
  s = .ArithmeticSequence~new(2, 3)

  self~assertEquals(155, s~sum(10))

::method testAverage
  s = .ArithmeticSequence~new(2, 3)

  self~assertEquals(15.5, s~average(10))
  
::method testDifference
  s = .ArithmeticSequence~new(2, 3)

  self~assertEquals(3, s~difference)

::method testFirstTerm
  s = .ArithmeticSequence~new(7, 5)

  self~assertEquals(7, s~firstTerm)

::method testMakeArray
  s = .ArithmeticSequence~new(2, 3)

  expected = .Array~of(2, 5, 8, 11, 14)
  self~assertEquals(expected~makeString(, ","), s~makeArray(5)~makeString(, ","))

::method testNegativeDifference
  s = .ArithmeticSequence~new(10, -2)

  self~assertEquals(10, s[1])
  self~assertEquals(8,  s[2])
  self~assertEquals(2,  s[5])
  
::method testZeroDifference
  s = .ArithmeticSequence~new(42, 0)

  self~assertTrue(s~isA(.ConstantSequence))
  self~assertEquals(42, s[1])
  self~assertEquals(42, s[10])
  self~assertEquals(420, s~sum(10))
