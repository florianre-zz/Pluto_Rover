require 'test/unit'
require './src/map.rb'

class TestMap < Test::Unit::TestCase

  def test_initialise
  	map = Map.new(10, 10)
  	assert_equal(map.width, 10)
    assert_equal(map.height, 10)
  end

  def test_leave_scent
    width = 10
    height = 10
    map = Map.new(width, height)

    map.leave_scent(width - 1, height - 1)
    map.leave_scent(width - width, 4)

    assert_equal(map.out_of_bound_coordinates.length, 2)
    assert_true(map.out_of_bound_coordinates.include?([width - 1, height - 1]))
    assert_true(map.out_of_bound_coordinates.include?([width - width, 4]))
  end

  def test_has_scent
    width = 10
    height = 10
    map = Map.new(width, height)

    map.leave_scent(width - 1, height - 1)
    map.leave_scent(width - width, 4)

    assert_true(map.has_scent(width - 1, height - 1))
    assert_true(map.has_scent(width - width, 4))
  end

end
