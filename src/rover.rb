require './src/map.rb'

class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY
  attr_reader :map

	@@possible_directions = ['W', 'N', 'E', 'S']
	@@width = 20
	@@height = 20

	def initialize(direction, positionX, positionY)
		@positionX = positionX
		@positionY = positionY
	  @direction = direction
		@map = Map.new(@@width, @@height)
	end

	def move_forward
  	case @direction
			when "N"
				@positionY = (@positionY + 1) % @@height
			when "S"
				@positionY = (@positionY - 1) % @@height
			when "W"
				@positionX = (@positionX - 1) % @@width
			when "E"
				@positionX = (@positionX + 1) % @@width
		end
	end

	def move_backward
		case @direction
			when "N"
				@positionY = (@positionY - 1) % @@height
			when "S"
				@positionY = (@positionY + 1) % @@height
			when "W"
				@positionX = (@positionX - 1) % @@width
			when "E"
				@positionX = (@positionX - 1) % @@width
		end
	end

	def turn_left
		curr_index = @@possible_directions.index(@direction)
		new_index = (curr_index - 1) % @@possible_directions.length
		@direction = @@possible_directions[new_index]
	end

	def turn_right
		curr_index = @@possible_directions.index(@direction)
		new_index = (curr_index + 1) % @@possible_directions.length
		@direction = @@possible_directions[new_index]
	end

end
