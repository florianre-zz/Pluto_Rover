require 'test/unit'
require './src/rover.rb'

class TestRover < Test::Unit::TestCase

  # TODO: Add more tests to check more cases
  # TODO: Check correct functions are being called

  def test_initialise
    initial_direction = 'N'
    initial_positionX = 0
    initial_positionY = 0
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

  	assert_equal(rover.direction, initial_direction)
    assert_equal(rover.positionX, 0)
    assert_equal(rover.positionY, 0)
  end

  def test_move_forward
    initial_direction = 'N'
    initial_positionX = 0
    initial_positionY = 0
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.move('F')

    assert_equal(rover.direction, initial_direction)
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY + 1)
  end

  def test_move_backward
    initial_direction = 'E'
    initial_positionX = 4
    initial_positionY = 5
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.move('B')

    assert_equal(rover.direction, initial_direction)
    assert_equal(rover.positionX, initial_positionX - 1)
    assert_equal(rover.positionY, initial_positionY)
  end

  def test_turn_left
    initial_direction = 'W'
    initial_positionX = 0
    initial_positionY = 0
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.turn('L')

    assert_equal(rover.direction, 'S')
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY)
  end

  def test_turn_right
    initial_direction = 'W'
    initial_positionX = 0
    initial_positionY = 0
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.turn('R')

    assert_equal(rover.direction, 'N')
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY)
  end

  # def test_wrapping_width
  #   initial_direction = 'W'
  #   initial_positionX = 0
  #   initial_positionY = 0
  #   map = Map.new(20, 20)
  #   rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)
  #
  #   rover.move('F')
  #
  #   assert_equal(rover.direction, initial_direction)
  #   assert_equal(rover.positionX, rover.map.width - 1)
  #   assert_equal(rover.positionY, initial_positionY)
  #
  # end
  #
  # def test_wrapping_height
  #   initial_direction = 'N'
  #   initial_positionX = 0
  #   initial_positionY = 0
  #   map = Map.new(20, 20)
  #   rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)
  #
  #   rover.move('B')
  #
  #   assert_equal(rover.direction, initial_direction)
  #   assert_equal(rover.positionX, initial_positionX)
  #   assert_equal(rover.positionY, rover.map.height - 1)
  # end

end
