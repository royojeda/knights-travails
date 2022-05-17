class Move
  attr_reader :location
  attr_writer :wnw, :nnw, :nne, :ene, :ese, :sse, :ssw, :wsw

  def initialize(location)
    @location = location
    @wnw = nil
    @nnw = nil
    @nne = nil
    @ene = nil
    @ese = nil
    @sse = nil
    @ssw = nil
    @wsw = nil
  end
end
