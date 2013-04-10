OperatorTable addOperator("//", 2)

Number dividedBy := Number getSlot("/")

Number / := method( divisor,
	if(divisor == 0,
		0,
		self dividedBy(divisor)
	)
)

"10 / 5 = " println
(10 / 5) println


"\n10 / 0 = " println
(10 / 0) println