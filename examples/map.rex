#!/usr/bin/env rexx

cube = .routines['CUBE']

-- Natural numbers (except 0)
naturals = .ArithmeticSequence~new(1, 1)

say 'ℕ - {0} = {'naturals~first(10)~makestring(, ', ')'...}'

cubes = naturals~map(cube)

say 'perfect cubes = {'cubes~first(10)~makestring(, ', ')'...}'

exit

::routine cube public
  use arg n
  return n**3

::requires 'Math/Sequences'
