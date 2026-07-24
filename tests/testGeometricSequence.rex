#!/usr/bin/env rexx

suite = .TestSuite~new(.TestGeometricSequence)

result = .TestResult~new
formatter = .SimpleConsoleFormatter~new(result)

suite~execute(result)

formatter~print

::requires "OOREXXUNIT.CLS"
::requires "../Math/Sequences"

::class 'TestGeometricSequence' subclass TestCase public

::method testTerm
  s = .GeometricSequence~new(2, 3)

  self~assertEquals(2,  s[1])
  self~assertEquals(6,  s[2])
  self~assertEquals(18,  s[3])
  self~assertEquals(39366, s[10])

::method testSum
  s = .GeometricSequence~new(2, 3)

  self~assertEquals(59048, s~sum(10))

::method testProd
  s = .GeometricSequence~new(2, 3)

  self~assertEquals(216, s~prod(3))
  
::method testInfiniteSum
  s = .GeometricSequence~new(2, 0.5)

  self~assertEquals(4, s~sumAll)
  
::method testAverage
  s = .GeometricSequence~new(2, 3)

  self~assertEquals(5904.8, s~average(10))
  
::method testRatio
  s = .GeometricSequence~new(2, 3)

  self~assertEquals(3, s~ratio)

::method testFirstTerm
  s = .GeometricSequence~new(7, 5)

  self~assertEquals(7, s~firstTerm)

::method testMakeArray
  s = .GeometricSequence~new(3, 2)

  expected = .Array~of(3, 6, 12, 24, 48)
  self~assertEquals(expected~makeString(, ","), s~makeArray(5)~makeString(, ","))

::method testNegativeRatio
  s = .GeometricSequence~new(10, -1)

  self~assertEquals(10, s[1])
  self~assertEquals(-10,  s[2])
  self~assertEquals(10,  s[5])
  
::method testOneRatio
  s = .GeometricSequence~new(42, 1)

  self~assertTrue(s~isA(.ConstantSequence))
  self~assertEquals(42, s[1])
  self~assertEquals(42, s[10])
  self~assertEquals(420, s~sum(10))

::method testZeroRatio
  s = .GeometricSequence~new(5, 0)

  self~assertEquals(5, s[1])
  self~assertEquals(0, s[2])
  self~assertEquals(0, s[20])
