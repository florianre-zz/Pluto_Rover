class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY

	def initialize(direction, postionX, positionY)
		@postionX = postionX
		@postionY = positionY
	  @direction = direction
	end

end
