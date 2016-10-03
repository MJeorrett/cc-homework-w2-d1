require('minitest/autorun')
require('minitest/rg')
require_relative('../engine')
require('pry-byebug')

class EngineTest < MiniTest::Test

  def setup
    @engine1_acceleration = 10
    @engine1_fuel_usage = 5
    @engine1_max_speed = 151

    @engine1 = Engine.new(
      @engine1_acceleration,
      @engine1_fuel_usage,
      @engine1_max_speed
    )
  end

  def test_acceleration()
    assert_equal(@engine1_acceleration, @engine1.acceleration)
  end

  def test_fuel_usage()
    assert_equal(@engine1_fuel_usage, @engine1.fuel_usage)
  end

  def test_max_speed()
    assert_equal(@engine1_max_speed, @engine1.max_speed)
  end

  def test_accelerate()
    start_speed = 15
    expected_speed = start_speed + @engine1_acceleration
    assert_equal(expected_speed, @engine1.accelerate(start_speed))
  end

  def test_accelerate_through_max_speed()
    actual = @engine1.accelerate(@engine1_max_speed - 2)
    assert_equal(@engine1_max_speed, actual)
  end

  def test_accelerate_from_max_speed()
    actual = @engine1.accelerate(@engine1_max_speed)
    assert_equal("Already at max speed!", actual)
  end
end
