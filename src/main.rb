require './src/rover.rb'

def main

  uppper_right = STDIN.gets.chomp.delete(' ')
  width = uppper_right[0].to_i + 1
	height = uppper_right[1].to_i + 1
  map = Map.new(width, height)

	want_to_continue = true
  while want_to_continue
		position = STDIN.gets.chomp.delete(' ')
		command = STDIN.gets.chomp
		# TODO: Check commands valid

		initial_positionX = position[0].to_i
		initial_positionY = position[1].to_i
		initial_direction = position[2]
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

		process(command, rover)
		termination = rover.lost ? "LOST\n" : "\n"
		puts "#{rover.positionX} #{rover.positionY} #{rover.direction} #{termination}"

		puts "Do you wish to continue? [Press Y for yes]"
		response = STDIN.gets.chomp
		want_to_continue = response == 'Y'
  end
end

def process(command, rover)
  termination = "\n"
	command.each_char { |c|
		case c
		when 'F', 'B'
			rover.move(c)
			if rover.lost
				break
			end
		when 'L', 'R'
			rover.turn(c)
		end
	}
end

main
