# Math Sequences API Reference

This document describes the public API provided by the **Math Sequences** library for **Open Object Rexx**.

All sequence classes derive from `Sequence` and share a common interface. Unless otherwise noted, methods documented for `Sequence` are available to every sequence type.

## Conventions

- Sequences are infinite and evaluated lazily.
- Sequence indices are **1-based**.

  `sequence[1]` is the first term.

- Constructors return immutable sequence objects.  
- Methods that transform a sequence return a new sequence without modifying the original one.
- Arithmetic operators (`+`, `-`, `*`, `/`, `//`, `%`, `**`) operate element-wise and return a `CombinedSequence`.

## Parameter arguments

- `n` denotes a positive integer.
- `count` denotes the number of terms to process.
- `routine` denotes a _callable_ Rexx object, such as `Routine` or  `Method`.

## List of classes

| Class                        | Description                            |
| ---------------------------- | -------------------------------------- |
| `Sequence`                   | Abstract base class.                   |
| `ArithmeticSequence`         | Arithmetic progression.                |
| `GeometricSequence`          | Geometric progression.                 |
| `ConstantSequence`           | Constant sequence.                     |
| `PrimeSequence`              | Prime numbers.                         |
| `PeriodicSequence`           | Periodic sequence.                     |
| `FixedBasePowerSequence`     | Powers with fixed base.                |
| `FixedExponentPowerSequence` | Powers with fixed exponent.            |
| `CombinedSequence`           | Element-wise combination of sequences. |
| `MappedSequence`             | Sequence transformation.               |
| `FilteredSequence`           | Sequence filtering.                    |
| `MemoizedSequence`           | Cached sequence.                       |


## The `Sequence` class

Abstract base class for all mathematical sequences.

### Methods

| Method | Description |
|--------|-------------|
| `term(n)` | Returns the *n*-th term. Equivalent to `[n]`. |
| `firstTerm()` | Returns the first term. Equivalent to `[1]`. |
| `first(count)` | Returns an `Array` containing the first `count` terms. |
| `makearray(count)` | Alias of `first(count)`. |
| `sum(count)` | Returns the sum of the first `count` terms. |
| `prod(count)` | Returns the product of the first `count` terms. |
| `average(count)` | Returns the arithmetic mean of the first `count` terms. |
| `map(routine)` | Returns a `MappedSequence`. |
| `filter(routine)` | Returns a `FilteredSequence`. |
| `toString()` | Returns a `String` representation of the sequence. |

### Operators

| Operator | Description |
|----------|-------------|
| `[n]` | Returns the *n*-th term. Implemented by subclasses. |
| `+` | Element-wise addition. |
| `-` | Element-wise subtraction. |
| `*` | Element-wise multiplication. |
| `/` | Element-wise division. |
| `//` | Element-wise integer division. |
| `%` | Element-wise remainder. |
| `**` | Element-wise exponentiation. |

All arithmetic operators return a `CombinedSequence`.

Operands that are not are instances of a `Sequence`, are automatically converted to a `ConstantSequence` objects.

## The `ArithmeticSequence` class

Arithmetic sequence (progression): `aₙ = a₁ + (n − 1) · d`.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(first, difference)` | Returns an arithmetic sequence with the given first term and common difference. |

If `difference` is 0, returns a `ConstantSequence`.

### Methods

| Method | Description |
|--------|-------------|
| `difference()` | Returns the common `difference`. |

## The `GeometricSequence` class

Geometric sequence (progression): `aₙ = a₁ · rⁿ⁻¹`.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(first, ratio)` | Returns a geometric sequence with the given first term and common ratio. |

If `ratio` is 1, returns a `ConstantSequence`.

### Methods

| Method | Description |
|--------|-------------|
| `ratio()` | Returns the common `ratio`. |
| `sumAll()` | Returns the infinite sum. If `|ratio| >= 1`, it raises a syntax error. |

## The `ConstantSequence` class

Constant sequence: `aₙ = k`.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(k)` | Returns a sequence whose every term is `k`. |

## The `FixedExponentPowerSequence` class

Sequence of powers with a fixed exponent: `aₙ = nˣ`.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(x)` | Returns a sequence of powers with fixed exponent `x`. |

## The `FixedBasePowerSequence` class

Sequence of powers with a fixed base: `aₙ = bⁿ`.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(b)` | Returns a sequence of powers with fixed base `b`. |

## The `PeriodicSequence` class

Periodic sequence.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(pattern)` | Creates a sequence by repeating the elements of `pattern`.  |

### Methods

| Method | Description |
|--------|-------------|
| `period()` | Returns the length of the repeating pattern. |

## The `PrimeSequence` class

The prime numbers.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new()` | Returns the singleton instance of the prime number sequence. Subsequent calls return the exact same instance. |

## The `CombinedSequence` class

A sequence formed by combining two underlying sequences element-by-element using a specified message or operator.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(s1, s2, msg)` | Creates a sequence combining `s1` and `s2` by sending `msg` to each element of `s1` with the corresponding element of `s2`. |

## The `FilteredSequence` class

A sequence containing only the elements from a source sequence that satisfy a given filter predicate, evaluated lazily.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(seq, filter)` | Creates a filtered sequence from `seq` using `filter`. Raises a syntax error if `filter` is not callable. |

## The `MappedSequence` class

A sequence created by applying a transformation function to each element of a source sequence.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(s, m)` | Creates a mapped sequence from `s` using `m`. Raises a syntax error if `m` is not callable. |

## The `MemoizedSequence` class

A wrapper sequence that caches previously evaluated elements of a sequence to prevent redundant computations.

### Constructor

| Constructor | Description |
|------------|-------------|
| `new(s)` | Creates a memoized wrapper around sequence `s`. |
