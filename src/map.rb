class Map

  attr_reader :width
  attr_reader :height
  attr_reader :out_of_bound_coordinates

	def initialize(width, height)
		@width = width
		@height = height
		@out_of_bound_coordinates = []
	end


end
