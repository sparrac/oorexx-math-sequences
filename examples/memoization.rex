#!/usr/bin/env rexx

m = .MemoizedSequence~new(.CoolSequence~new(1, 1))

say m~first(10)~makestring(, ', ')

exit

::requires 'Math/Sequences'

::class CoolSequence subclass Sequence

::method init
  expose a1 a2
  use arg a1, a2
  
::method '[]'
  expose a1 a2
  use arg n
  
  if n = 1 then
    return a1
  if n = 2 then
    return a2
    
  return self[n - 1] + self[n - 2]
  
