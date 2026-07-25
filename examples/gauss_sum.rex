#!/usr/bin/env rexx

-- Natural numbers (except 0)

naturals = .ArithmeticSequence~new(1, 1)
say naturals~toString

d  = naturals~difference
a1 = naturals~firstTerm

say 'd =' d
say 'a[1] =' a1
say 'a[n] =' a1 '+ (n - 1) ·' d

-- Sum of the first 100 terms
say 'S[100] =' naturals~sum(100)
-- Product of the first 100 terms
say 'P[100] =' naturals~prod(100)

exit

::requires 'Math/Sequences'
