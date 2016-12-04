require './src/map.rb'

class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY
  attr_reader :map

	@@possible_directions = ['W', 'N', 'E', 'S']

  # TODO: Add check to see if position is in bounds of map
	def initialize(direction, positionX, positionY, map)
		@positionX = positionX
		@positionY = positionY
	  @direction = direction
		@map = map
	end

	def move(command)
  	case @direction
			when "N"
				new_position = command == 'F' ?  @positionY + 1 : @positionY - 1
				@positionY = new_position % @map.height
			when "S"
				new_position = command == 'F' ? @positionY - 1 : @positionY + 1
				@positionY = new_position % @map.height
			when "W"
				new_position = command == 'F' ? @positionX - 1 : @positionX + 1
				@positionX = new_position % @map.width
			when "E"
				new_position = command == 'F' ? @positionX + 1 : @positionX - 1
				@positionX = new_position % @map.width
		end
	end

  def turn(command)
 		curr_index = @@possible_directions.index(@direction)
		new_index = (command == 'L' ? (curr_index - 1) : (curr_index + 1)) % @@possible_directions.length
		@direction = @@possible_directions[new_index]
	end

end
