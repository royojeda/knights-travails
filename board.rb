require_relative 'move'

class Board
  attr_accessor :moves

  def initialize
    @moves = []
    build_board
  end

  def build_board
    x = 0
    while x <= 7
      y = 0
      while y <= 7
        moves.push(Move.new([x, y]))
        y += 1
      end
      x += 1
    end
  end
end
