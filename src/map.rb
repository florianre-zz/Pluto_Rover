class Map

  attr_reader :width
  attr_reader :height
  attr_reader :minX
  attr_reader :minY
  attr_reader :out_of_bound_coordinates

  def initialize(width, height)
    @width = width
    @height = height
    @minX = 0
    @minY = 0
    @out_of_bound_coordinates = []
  end

  def leave_scent(positionX, positionY)
    @out_of_bound_coordinates.push([positionX, positionY])
  end

  def has_scent(positionX, positionY)
    return @out_of_bound_coordinates.include?([positionX, positionY])
  end

end
