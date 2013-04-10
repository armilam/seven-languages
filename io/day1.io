
Thing := Object clone
something := Thing clone

Thing aString := "It's a Thing string"
Thing printAString := method( aString println )
Thing runThisByNameInAString := method( "Hooray! It ran!" println )

something printAString

something performWithArgList("runThisByNameInAString", list())
