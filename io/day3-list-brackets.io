squareBrackets := method(
	l := List clone
	call message arguments map(arg, doMessage(arg))
)

List squareBrackets := method(i,
	at(i)
)

myList := [1, 4, [5, 9, 8], 7]

myList println
myList[2][2] println
