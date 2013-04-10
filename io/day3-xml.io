
OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
	m := Map clone
	call message arguments foreach(arg,
		m doMessage(arg))
	m
)

Builder := Object clone
Builder forward := method(
	writeln("<", call message name, ">")
	call message arguments foreach(
		arg,
		content := self doMessage(arg)
		if(content type == "Sequence", writeln(" ", content)))
	writeln("</", call message name, ">"))


Builder ul(
			li("Lua"),
			li("Io"),
			li("Javascript"))