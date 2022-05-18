class Move
  attr_accessor :location, :parent

  def initialize(location, parent)
    @location = location
    @parent = parent
  end
end
