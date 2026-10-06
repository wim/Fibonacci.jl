module Fibonacci
"""
Fast doubling Fibonacci algorithm
Function works identical to the Python version at Project Nayuki
https://www.nayuki.io/page/fast-fibonacci-algorithms
"""

export fibonacci



"""
    fibonacci(n)

Compute the fibonacci number for the supplied positive integer `n`,
in an efficient way.

"""
function fibonacci(n)
    if n < 0
        return "ERROR: only positive integer arguments allowed"
    end
    _fib(n)[1]
end

"""
    _fib(n)

Internal recursive function to compute the Fibonacci number for the supplied
positive integer `n` with little overhead.
Returns a tuple, with the first one being the fibonacci number.
"""
function _fib(n)
    if n == 0
        return (0, 1)
    else
        a, b = _fib(div(n,2))
        c = a*(b*2-a)
        d = a*a + b*b
        if iseven(n)
            return (c,d)
        else
            return (d, c+d)
        end
    end
end

end # module Fibonacci
