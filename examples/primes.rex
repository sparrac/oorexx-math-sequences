#!/usr/bin/env rexx

parse arg count

if count = '' then
  count = 100

primes = .PrimeSequence~new

say 'ℙ = {'primes~first(count)~makestring(, ', ')'...}'

exit

::requires 'Math/Sequences'
