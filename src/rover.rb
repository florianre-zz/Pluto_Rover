require './src/map.rb'

class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY
  attr_reader :map

	@@possible_directions = ['W', 'N', 'E', 'S']
	@@width = 20
	@@height = 20

  # TODO: Add check to see if position is in bounds of map
	def initialize(direction, positionX, positionY)
		@positionX = positionX
		@positionY = positionY
	  @direction = direction
		@map = Map.new(@@width, @@height)
	end

  # TODO: Implement obstacle feature
	def move(command)
  	case @direction
			when "N"
				new_position = command == 'F' ?  @positionY + 1 : @positionY - 1
				@positionY = new_position % @@height
			when "S"
				new_position = command == 'F' ? @positionY - 1 : @positionY + 1
				@positionY = new_position % @@height
			when "W"
				new_position = command == 'F' ? @positionX - 1 : @positionX + 1
				@positionX = new_position % @@width
			when "E"
				new_position = command == 'F' ? @positionX + 1 : @positionX - 1
				@positionX = new_position % @@width
		end
	end

  def turn(command)
 		curr_index = @@possible_directions.index(@direction)
		new_index = (command == 'L' ? (curr_index - 1) : (curr_index + 1)) % @@possible_directions.length
		@direction = @@possible_directions[new_index]
	end

end
