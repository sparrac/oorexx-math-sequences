#!/usr/bin/env rexx

isEven = .routines['ISEVEN']

a = .ArithmeticSequence~new(1, 3)


say 'Sequence:'
say '{'a~first(10)~makestring(, ', ')'...}'

fa = a~filter(isEven)

say 'Only even terms:'
say '{'fa~first(10)~makestring(, ', ')'...}'

exit

::routine isEven public
  use arg n
  return (n//2 = 0)

::requires 'Math/Sequences'
