require './src/rover.rb'

def main
	rover = Rover.new('S', 10, 10)

	puts "Enter a command of one or more of the following: F, B, L, R"
	STDOUT.flush
	command = gets.chomp

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

		puts "Rover at #{rover.positionX}, #{rover.positionY} facing #{rover.direction}"
	}
end

main
