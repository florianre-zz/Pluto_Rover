class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY

	def initialize(direction, positionX, positionY)
		@positionX = positionX
		@positionY = positionY
	  @direction = direction
	end

end
