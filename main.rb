require_relative 'board'
require_relative 'move'

board = Board.new
p board.knight_moves([0, 0], [6, 5])
