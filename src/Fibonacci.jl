module Fibonacci

export fibonacci

function fibonacci(n)
	if n < 0
		return "ERROR: only positive integer arguments allowed"
	end
	_fib(n)[1]
end

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
