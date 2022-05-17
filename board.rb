require_relative 'move'

class Board
  attr_accessor :root

  def initialize
    @root = build_board
  end

  def build_board(x = 0, y = 0, made = [])
    case [x, y]
    in [0..7, 0..7] unless made.include?([x, y])
      current = Move.new(x, y)
      made.push([x, y])

      current.wnw = build_board(x - 2, y + 1, made)
      current.nnw = build_board(x - 1, y + 2, made)
      current.nne = build_board(x + 1, y + 2, made)
      current.ene = build_board(x + 2, y + 1, made)
      current.ese = build_board(x + 2, y - 1, made)
      current.sse = build_board(x + 1, y - 2, made)
      current.ssw = build_board(x - 1, y - 2, made)
      current.wsw = build_board(x - 2, y - 1, made)
    else
      return
    end
    puts "#{made}\n\n"
    puts "#{made.length}\n\n"
    current
  end
end
