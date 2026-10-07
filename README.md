# Fibonacci

Small test module that implements an efficient method to compute Fibonacci numbers.

## Motivation

It was created because on the main julialang.org website, a code example is shown where Fibonacci numbers are computed with a recursive program that uses threads to distribute the work. Copying this program and running it myself did not work for anything more than fib(30), which, according to @time, required about 5s.
For fib(40), it took so long, julia was killed by the terminal...

A second motivation is to start learning Julia :-)

## Algorithms

The module contains a number of implementations that compute Fibonacci numbers and can compare their performance.

### fib_julialang

The algorithm as found on the main page of julialang, and that got killed for n=40.

### fib_array_sum

A simple method to compute all fibonacci numbers from 1 to n, by creating an array and iterating over its elements, adding the previous two values (n-2) and (n-1) to get the value at n. It returns the last value as answer.

### fib_fast_doubling

Translation of Python version found at Project Nayuki (https://www.nayuki.io/page/fast-fibonacci-algorithms



