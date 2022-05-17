class Move
  attr_reader :location

  def initialize(location)
    @location = location
    add_children
  end

  def add_children
    @wnw = calc_wnw
    @nnw = calc_nnw
    @nne = calc_nne
    @ene = calc_ene
    @ese = calc_ese
    @sse = calc_sse
    @ssw = calc_ssw
    @wsw = calc_wsw
  end

  def calc_wnw
    child = [location[0] - 2, location[1] + 1]
    valid?(child)
  end

  def calc_nnw
    child = [location[0] - 1, location[1] + 2]
    valid?(child)
  end

  def calc_nne
    child = [location[0] + 1, location[1] + 2]
    valid?(child)
  end

  def calc_ene
    child = [location[0] + 2, location[1] + 1]
    valid?(child)
  end

  def calc_ese
    child = [location[0] + 2, location[1] - 1]
    valid?(child)
  end

  def calc_sse
    child = [location[0] + 1, location[1] - 2]
    valid?(child)
  end

  def calc_ssw
    child = [location[0] - 1, location[1] - 2]
    valid?(child)
  end

  def calc_wsw
    child = [location[0] - 2, location[1] - 1]
    valid?(child)
  end

  def valid?(child)
    case child
    in [0..8, 0..8]
      child
    else
      nil
    end
  end
end
