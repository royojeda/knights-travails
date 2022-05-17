require_relative 'move'

class Board
  attr_reader :root

  def initialize
    @root = build_board
  end

  def build_board(location = [0, 0])
    Move.new(location)
  end
end
