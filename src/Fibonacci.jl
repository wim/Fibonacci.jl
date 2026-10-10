module Fibonacci
"""
Test of various algorithms to compute Fibonacci numbers
(and me learning Julia)
"""

export fib, fib_fast_doubling, fib_array_sum, fib_julialang,
fib_array_gen

# by default, fib uses the fast doubling algorithm

function fib(n)
    fib_fast_doubling(n)
end

"""
    fib_fast_doubling(n)

Fast doubling Fibonacci algorithm, computes the fibonacci number 
for the supplied positive integer `n` in an efficient way.

Function works identical to the Python version at Project Nayuki
https://www.nayuki.io/page/fast-fibonacci-algorithms

This routine allocates a fixed amount of memory, irrespective of the value of n

"""
function fib_fast_doubling(n)
    if n < 0
        throw(DomainError(n, "only positive integer arguments allowed"))
    end
    _fib(n)[1]
end # function fib_fast_doubling

"""
    _fib(n)

Internal recursive function to compute the Fibonacci number for 
the supplied positive integer `n` with little overhead.
Returns a tuple, with the first one being the fibonacci number.
"""
function _fib(n)
    if n == 0
        return (0, 1)
    else
        a, b = _fib(div(n,2))
        c = a * (b * 2 - a)
        d = a * a + b * b
        if iseven(n)
            return (c,d)
        else
            return (d, c+d)
        end
    end
end # function _fib


"""
    fib_array_sum(n)

Compute the fibonacci number for the supplied positive integer `n`
by allocating an array with numbers 0:n, iterating over them
and storing the result in place of the initial integer value

This is not too slow, but allocates a lot of memory
"""
function fib_array_sum(n)
    if n < 0
        throw(DomainError(n, "only positive integer arguments allowed"))
    end
    n < 2 && return n
    arr = Array(0:n)
    for i in 3:n+1
        arr[i] = arr[i-2]+arr[i-1]
    end
    return arr[n+1]
end # function fib_array_sum

"""
    fib_array_gen(n)

Compute the fibonacci number for the supplied positive integer `n`
by looping over n (using a generator) with  minimal allocations
"""
function fib_array_gen(n)
    if n < 0
        throw(DomainError(n, "only positive integer arguments allowed"))
    end
    n < 2 && return n
    x0 = 0
    x1 = 1
    x2 = 1
    for i in 3:n
        x0 = x1
        x1 = x2
        x2 = x0+x1
    end
    return x2

end

"""
    fib_julialang(n)

Compute the fibonacci number for the supplied positive integer `n`
with the algorithm as shown on julialang.org (to showcase the use of Threads)
This is so inefficient (on my laptop), julia gets killed with n=50...

"""
function fib_julialang(n)
    if n < 0
        throw(DomainError(n, "only positive integer arguments allowed"))
    end
    n < 2 && return n
    t = Threads.@spawn fib_julialang(n-2)
    return fib_julialang(n-1) + fetch(t)
    
end # function fib_julialang

end # module Fibonacci

