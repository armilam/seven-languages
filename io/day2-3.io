
List sumRec := method(
	self flatten sum
)

numbers := list(list(1,2,3), list(3,6,9))

(numbers sumRec) println
