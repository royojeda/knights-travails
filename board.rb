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

  def enqueue(current, position)
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
        trace_steps(current)
        return
      end

      children = calc_children(current)
      children.each { |child| enqueue(current, child) }
    end
    puts 'Invalid destination.'
  end

  def trace_steps(current)
    arr = []
    until current.nil?
      arr.push(current.location)
      current = current.parent
    end
    p arr.reverse
  end

  def calc_children(current)
    arr = []
    arr.push(nne(current))
    arr.push(ene(current))
    arr.push(ese(current))
    arr.push(sse(current))
    arr.push(ssw(current))
    arr.push(wsw(current))
    arr.push(wnw(current))
    arr.push(nnw(current))
  end

  def nne(current)
    [current.location[0] + 1, current.location[1] + 2]
  end

  def ene(current)
    [current.location[0] + 2, current.location[1] + 1]
  end

  def ese(current)
    [current.location[0] + 2, current.location[1] - 1]
  end

  def sse(current)
    [current.location[0] + 1, current.location[1] - 2]
  end

  def ssw(current)
    [current.location[0] - 1, current.location[1] - 2]
  end

  def wsw(current)
    [current.location[0] - 2, current.location[1] - 1]
  end

  def wnw(current)
    [current.location[0] - 2, current.location[1] + 1]
  end

  def nnw(current)
    [current.location[0] - 1, current.location[1] + 2]
  end
end
