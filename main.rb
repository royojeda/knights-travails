require_relative 'board'
require_relative 'move'

board = Board.new
board.knight_moves([0, 0], [7, 7])
