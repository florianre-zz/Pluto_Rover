class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY

	@@possible_directions = ['N', 'W', 'S', 'E']

	def initialize(direction, positionX, positionY)
		@positionX = positionX
		@positionY = positionY
	  @direction = direction
	end

	def move_forward
  	case @direction
			when "N"
				@positionY += 1
			when "S"
				@positionY -= 1
			when "W"
				@positionX -= 1
			when "E"
				@positionX += 1
		end
	end

	def move_backward
		case @direction
			when "N"
				@positionY -= 1
			when "S"
				@positionY += 1
			when "W"
				@positionX += 1
			when "E"
				@positionX -= 1
		end
	end

	def turn_left
		curr_index = @@possible_directions.index(@direction)
		new_index = (curr_index - 1) % @@possible_directions.length
		@direction = @@possible_directions[new_index]
	end

	def turn_right

	end

end
