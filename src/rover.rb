require './src/map.rb'

class Rover

  attr_reader :direction
  attr_reader :positionX
	attr_reader :positionY
  attr_reader :map
  attr_reader :lost

	@@possible_directions = ['W', 'N', 'E', 'S']

  # TODO: Add check to see if position is in bounds of map
	def initialize(direction, positionX, positionY, map)
		@positionX = positionX
		@positionY = positionY
	  @direction = direction
		@map = map
		@lost = false
	end

	def move(command)
  	case @direction
		when "N"
			new_position = command == 'F' ?  @positionY + 1 : @positionY - 1
			if new_position < @map.height && new_position >= 0
				@positionY = new_position
			else
				handle_out_of_bounds()
			end

		when "S"
			new_position = command == 'F' ? @positionY - 1 : @positionY + 1
			if new_position < @map.height && new_position >= 0
				@positionY = new_position
			else
				handle_out_of_bounds()
			end

		when "W"
			new_position = command == 'F' ? @positionX - 1 : @positionX + 1
			if new_position < @map.width && new_position >= 0
				@positionX = new_position
			else
				handle_out_of_bounds()
			end

		when "E"
			new_position = command == 'F' ? @positionX + 1 : @positionX - 1
			if new_position < @map.width && new_position >= 0
				@positionX = new_position
			else
				handle_out_of_bounds()
			end
		end

	end

  def turn(command)
 		curr_index = @@possible_directions.index(@direction)
		new_index = (command == 'L' ? (curr_index - 1) : (curr_index + 1)) % @@possible_directions.length
		@direction = @@possible_directions[new_index]
	end

	private
	def handle_out_of_bounds()
		is_scented = @map.has_scent(@positionX, @positionY)
		if not is_scented
			@lost = true
			@map.leave_scent(@positionX, @positionY)
		end
	end

end
