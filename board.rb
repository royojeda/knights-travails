require_relative 'move'

class Board
  attr_accessor :moves, :done, :queue

  def initialize
    @moves = []
    @done = []
    @queue = []
    build_board
  end

  def build_board
    x = 0
    while x <= 7
      y = 0
      while y <= 7
        moves.push(Move.new([x, y], nil))
        y += 1
      end
      x += 1
    end
  end

  def enqueue_child(current, position)
    child = moves.select { |move| move.location == position }[0]
    return if child.nil? || done.include?(child)

    child.parent = current
    queue.push(child)
  end

  def knight_moves(start, fin)
    queue.push moves.select { |move| move.location == start }[0]

    until queue.empty?
      current = queue.shift
      done.push(current)

      if current.location == fin
        arr = []
        until current.nil?
          arr.push(current.location)
          current = current.parent
        end
        p arr.reverse
        return
      end

      x = current.location[0]
      y = current.location[1]

      nne = [x + 1, y + 2]
      ene = [x + 2, y + 1]
      ese = [x + 2, y - 1]
      sse = [x + 1, y - 2]
      ssw = [x - 1, y - 2]
      wsw = [x - 2, y - 1]
      wnw = [x - 2, y + 1]
      nnw = [x - 1, y + 2]

      children = [nne, ene, ese, sse, ssw, wsw, wnw, nnw]

      children.each { |child| enqueue_child(current, child) }
    end
  end
end
