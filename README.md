# Math Sequences

[![Language: ooRexx](https://img.shields.io/badge/Language-Open_Object_Rexx-red.svg)](https://www.oorexx.org/)

Object-oriented mathematical sequence library for Open Object Rexx.

## Description

This library provides a collection of mathematical sequences together with a common object-oriented API for creating, combining and transforming them.

Sequences are evaluated lazily: terms are only computed when requested. The library also includes sequence decorators such as filtering, memoization and mapping, allowing complex sequences to be built from simpler ones.

## Features

### Available sequences

- Arithmetic sequences
- Geometric sequences
- Constant sequences
- Prime numbers
- Periodic sequences
- Fixed-base power sequences
- Fixed-exponent power sequences
  
### Transformations

- Memoization
- Filtering
- Mapping

### Generic operations

- Element-wise combination of sequences using arithmetic operators
- `sum()`, `prod()`, `average()`, `first()`, `makearray()`

## Requirements

- [Open Object Rexx](https://sourceforge.net/projects/oorexx/files/) 5

## Current status

This project is currently under development.

Implemented classes:

- `Sequence`
- `ArithmeticSequence`
- `GeometricSequence`
- `ConstantSequence`
- `PrimeSequence`
- `PeriodicSequence`
- `FixedBasePowerSequence`
- `FixedExponentPowerSequence`
- `CombinedSequence`
- `FilteredSequence`
- `MappedSequence`
- `MemoizedSequence`

Planned features:

- `numeric digits` settings
- Improve `MemoizedSequence`
- Harmonic sequences
- Recurrence sequences
- Fibonacci and Lucas sequences
- Supplier (?): iterate with do/over
- Validation of parameters
- PolynomialSequence (?)

  a(n) = c0 + c1 n + c2 n² + ...

- FactorialSequence
- RandomSequence
- WhiteNoiseSequence
- Unit testing

## Installation

Copy the `Math` directory somewhere in your `REXX_PATH` (or `PATH`) and import it with:

~~~rexx
::requires "Math/Sequences"
~~~

## Quick Start

```rexx
a = .ArithmeticSequence~new(2, 3)

say a[1]      -- 2
say a[2]      -- 5
say a[10]     -- 12
say a~sum(10) -- 155

p = .PrimeSequence~new
say p[1]      -- 2
say p[100]    -- 541

odds = a~filter(.routines["ISODD"])

say odds[1]   -- 5
say odds~first(10)

b = a**2 + p
say b[1]      -- a[1]**2 + p[1] = 6

exit

::routine isOdd public
  use arg n
  return (n//2 <> 0)

::requires "Math/Sequences"
```

## Usage

### Design Philosophy

Every sequence is modelled as an infinite indexed object with **1-based indexing**.

```rexx
primes = .PrimeSequence~new
say primes[1] -- 2
say primes[2] -- 3
say primes[3] -- 5
```

Subclasses of `Sequence` only need to implement the **indexing operator**:

```rexx
::method '[]'
```

All other operations are implemented in terms of this method.

Sequences can also be combined using standard arithmetic operators:

```rexx
a = .ArithmeticSequence~new(2, 3)
b = .GeometricSequence~new(2, 3)
c = .ConstantSequence~new(3)

d = a * b - c ** 2

say d[10]
```

And transformed with `map` or `filter`:

```rexx

isEven = .routines['ISEVEN'] -- Filter
square = .routines['SQUARE'] -- Map

e = d~filter(isEven)~map(square)

say e[10]

exit

::routine isEven public
  use arg n
  return (n//2 = 0)

::routine square public
  use arg n
  return n**2
  
::requires 'Math/Sequences'
  
```

## Documentation

- API reference: `docs/API.md`
- Examples: `examples/`

## License

This project is distributed under the terms described in the `LICENSE` file.

## Author

Salvador Parra Camacho

GitHub: <https://github.com/sparrac>
