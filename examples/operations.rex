#!/usr/bin/env rexx

a = .ArithmeticSequence~new(2, 3)
b = .GeometricSequence~new(1, 2)
c = .ConstantSequence~new(7)
d = a ** 2 + b * c

s = (a, b, c, d)
do item over s
  say item~first(10)~makestring(, ',')
end

exit

::requires 'Math/Sequences'
