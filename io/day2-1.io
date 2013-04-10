
fibonacci := method(
	a,
	b,
	n,
	if(n == 0,
		b,
		fibonacci(b, a+b, n-1)
	)
)

fib := method(
	n,
	if(n < 3,
		1,
		fibonacci(1, 1, n-2)
	)
)

"fib(13) = " println
fib (13) println