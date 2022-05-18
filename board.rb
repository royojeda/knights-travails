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
        moves.push(Move.new([x, y], nil))
        y += 1
      end
      x += 1
    end
  end

  def knight_moves(start, fin)
    queue = [].push moves.select { |move| move.location == start }[0]
    done = []

    until queue.empty?
      current = queue.shift
      done.push(current)

      if current.location == fin
        arr = []
        until current.nil?
          arr.push(current.location)
          current = current.parent
        end
        return arr.reverse
      end

      x = current.location[0]
      y = current.location[1]

      nne = moves.select { |move| move.location == [x + 1, y + 2] }[0]
      unless nne.nil? || done.include?(nne)
        nne.parent = current
        queue.push(nne)
      end

      ene = moves.select { |move| move.location == [x + 2, y + 1] }[0]
      unless ene.nil? || done.include?(ene)
        ene.parent = current
        queue.push(ene)
      end

      ese = moves.select { |move| move.location == [x + 2, y - 1] }[0]
      unless ese.nil? || done.include?(ese)
        ese.parent = current
        queue.push(ese)
      end

      sse = moves.select { |move| move.location == [x + 1, y - 2] }[0]
      unless sse.nil? || done.include?(sse)
        sse.parent = current
        queue.push(sse)
      end

      ssw = moves.select { |move| move.location == [x - 1, y - 2] }[0]
      unless ssw.nil? || done.include?(ssw)
        ssw.parent = current
        queue.push(ssw)
      end

      wsw = moves.select { |move| move.location == [x - 2, y - 1] }[0]
      unless wsw.nil? || done.include?(wsw)
        wsw.parent = current
        queue.push(wsw)
      end

      wnw = moves.select { |move| move.location == [x - 2, y + 1] }[0]
      unless wnw.nil? || done.include?(wnw)
        wnw.parent = current
        queue.push(wnw)
      end

      nnw = moves.select { |move| move.location == [x - 1, y + 2] }[0]
      unless nnw.nil? || done.include?(nnw)
        nnw.parent = current
        queue.push(nnw)
      end
    end
  end
end
