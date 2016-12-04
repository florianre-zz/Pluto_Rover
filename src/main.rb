require './src/rover.rb'

def main
	want_to_continue = true
  while want_to_continue
		position = STDIN.gets.chomp.delete(' ')
		command = STDIN.gets.chomp
		# TODO: Check commands valid

		initial_positionX = position[0].to_i
		initial_positionY = position[1].to_i
		initial_direction = position[2]
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY)

		process(command, rover)

		puts "Do you wish to continue? [Press Y for yes]"
		response = STDIN.gets.chomp
		want_to_continue = response == 'Y'
  end
end

def process(command, rover)
  command.each_char { |c|
		case c
			when 'F', 'B'
				rover.move(c)
      when 'L', 'R'
        rover.turn(c)
		end

		puts "#{c}: Rover at #{rover.positionX}, #{rover.positionY} facing #{rover.direction}"
	}
end

main
