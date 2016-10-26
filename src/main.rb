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
			when 'F'
				rover.move_forward
			else
				rover.move_backward
		end
		puts rover.direction
		puts rover.positionX
		puts rover.positionY
	}
end

main
