require 'test/unit'
require './src/rover.rb'

class TestRover < Test::Unit::TestCase

  # TODO: Add more tests to check more cases
  # TODO: Check correct functions are being called

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

  def test_width_lost
    initial_direction = 'W'
    initial_positionX = 0
    initial_positionY = 0
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.move('F')
    rover.move('F')

    assert_equal(rover.direction, 'W')
    assert_equal(rover.positionX, initial_positionX)
    assert_equal(rover.positionY, initial_positionY)
    assert_true(rover.lost)

    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.move('F')
    rover.move('F')
    rover.turn('R')
    rover.move('F')

    assert_equal(rover.direction, 'N')
    assert_equal(rover.positionX, 0)
    assert_equal(rover.positionY, 1)
    assert_false(rover.lost)
  end

  def test_height_lost
    initial_direction = 'N'
    initial_positionX = 19
    initial_positionY = 19
    map = Map.new(20, 20)
    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.move('F')
    rover.move('F')

    assert_equal(rover.direction, 'N')
    assert_equal(rover.direction, initial_direction)
    assert_equal(rover.positionX, initial_positionX)
    assert_true(rover.lost)

    rover = Rover.new(initial_direction, initial_positionX, initial_positionY, map)

    rover.move('F')
    rover.move('F')
    rover.turn('R')
    rover.move('F')
    rover.turn('R')
    rover.move('F')

    assert_equal(rover.direction, 'S')
    assert_equal(rover.positionX, 19)
    assert_equal(rover.positionY, 18)
    assert_false(rover.lost)
  end

end
