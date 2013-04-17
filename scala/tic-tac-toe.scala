
class TicTacToeBoard(board : List[List[Char]], turn : Char)
{
	val gameOver = this.announceWinner()

	def this() = this(List(List('_', '_', '_'), List('_', '_', '_'), List('_', '_', '_')), 'X')

	def nextTurn():Char = if(this.turn == 'X') 'Y' else 'X'
	def whoseTurn() = this.turn

	def legal(row : Integer, col : Integer) = board(row)(col) == '_'
	def move(row : Integer, col : Integer) = if(legal(row, col)) new TicTacToeBoard(board.updated(row, board(row).updated(col, this.whoseTurn())), this.nextTurn()) else this

	def rows() = board
	def columns() = List(List(board(0)(0), board(1)(0), board(2)(0)), List(board(0)(1), board(1)(1), board(2)(1)), List(board(0)(2), board(1)(2), board(2)(2)))
	def diagonals() = List(List(board(2)(0), board(1)(1), board(0)(2)), List(board(0)(0), board(1)(1), board(2)(2)))

	def getWinner():Char =
	{
		this.rows().foreach { row => if(row(0) != '_' && row(0) == row(1) && row(1) == row(2)) return row(0) }
		this.columns().foreach { column => if(column(0) != '_' && column(0) == column(1) && column(1) == column(2)) return column(0) }
		this.diagonals().foreach { diagonal => if(diagonal(0) != '_' && diagonal(0) == diagonal(1) && diagonal(1) == diagonal(2)) return diagonal(0) }
		this.rows().foreach { row => row.foreach { item => if(item == '_') return ' ' } }
		return '_'
	}

	def announceWinner():Boolean =
	{
		val winner = this.getWinner()

		if(winner == ' ') return false
		if(winner == '_') println("It was a tie!")
		println("A winner is " + winner + "!")

		return true
	}

	override def toString:String =
	{
		val str = new StringBuilder
		board.foreach { row => row.foreach { item => str += item }; str += '\n' }
		str.toString
	}
}

var myBoard = new TicTacToeBoard()

println("When entering a move input should look like this:")
println("Enter a move: 1,2")

while(!myBoard.gameOver)
{
	print(myBoard.whoseTurn + "'s turn, enter a move: ")
	val input = readLine()
	myBoard = myBoard.move(input.charAt(0) - 48, input.charAt(2) - 48)
	println(myBoard)
}

