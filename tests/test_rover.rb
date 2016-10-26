require 'test/unit'
require './src/rover.rb'

class TestRover < Test::Unit::TestCase

  def test_initialise
  	rover = Rover.new('N', 0, 0)
  	assert_equal(rover.direction, 'N')
  end

end
