require './src/rover.rb'

def main
	initial_direction = 'N'
	initial_positionX = 0
	initial_positionY = 0
	rover = Rover.new(initial_direction, initial_positionX, initial_positionY)

  puts "Rover at #{rover.positionX}, #{rover.positionY} facing #{rover.direction}"
  puts "Change the initial parameters in the main method if you want."
	puts "Enter a command of one or more of the following: F, B, L, R"
	STDOUT.flush
	command = gets.chomp

	# TODO: Check commands valid 

	process(command, rover)
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
