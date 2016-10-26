require 'test/unit'
require './src/map.rb'

class TestMap < Test::Unit::TestCase

  def test_initialise
  	map = Map.new(10, 10)
  	assert_equal(map.width, 10)
    assert_equal(map.height, 10)
  end

end
