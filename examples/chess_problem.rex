#!/usr/bin/env rexx

powersOfTwo = .GeometricSequence~new(1, 2)
say powersOfTwo~toString
r = powersOfTwo~ratio

N = 8

do i = 1 to N**2
  exp = toUnicodeExponent(i)
  say 'a['i']=' r || exp '=' powersOfTwo[i]
end

suma = powersOfTwo~sum(N**2)
say 'S['N**2'] =' suma
say 'a['N**2 + 1'] =' powersOfTwo[N**2 + 1]

exit

::requires 'Math/Sequences'

::routine toUnicodeExponent
  use arg n
  
  digits = '0123456789'
  exponents = ('⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹')
  
  exp = .Array~new()
  
  do while n <> ''
    parse var n digit +1 n
    index = pos(digit, digits)
    if index <> 0 then
      exp~append(exponents[index])
    else
      exp~append(digit)
  end
  
  return exp~makestring(, '')
