require 'test/unit'
require './src/rover.rb'

class TestRover < Test::Unit::TestCase

  def test_initialise
  	rover = Rover.new('N', 0, 0)
  	assert_equal(rover.direction, 'N')
    assert_equal(rover.positionX, 0)
    assert_equal(rover.positionY, 0)
  end

  def test_move_forward
    initial_direction = 'N'
    initial_positionX = 0
    initial_positionY = 0
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY)

    rover.move_forward

    assert_equal(rover.direction, initial_direction)
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY + 1)
  end

  def test_move_backward
    initial_direction = 'E'
    initial_positionX = 4
    initial_positionY = 5
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY)

    rover.move_backward

    assert_equal(rover.direction, initial_direction)
    assert_equal(rover.positionX, initial_positionX - 1)
    assert_equal(rover.positionY, initial_positionY)
  end

  def test_turn_left
    initial_direction = 'S'
    initial_positionX = 0
    initial_positionY = 0
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY)

    rover.turn_left

    assert_equal(rover.direction, 'W')
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY)
  end

  def test_turn_right
    initial_direction = 'W'
    initial_positionX = 0
    initial_positionY = 0
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY)

    rover.turn_right

    assert_equal(rover.direction, 'N')
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY)
  end

end
