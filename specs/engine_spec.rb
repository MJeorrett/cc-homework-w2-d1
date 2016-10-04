require('minitest/autorun')
require('minitest/rg')
require_relative('../engine')
require('pry-byebug')

class EngineTest < MiniTest::Test

  ENGINE1_ACCELERATION = 10
  ENGINE1_FUEL_USAGE = 5
  ENGINE1_MAX_SPEED = 151

  def setup

    @engine1 = Engine.new(
      ENGINE1_ACCELERATION,
      ENGINE1_FUEL_USAGE,
      ENGINE1_MAX_SPEED
    )
  end

  def test_acceleration()
    assert_equal(ENGINE1_ACCELERATION, @engine1.acceleration)
  end

  def test_fuel_usage()
    assert_equal(ENGINE1_FUEL_USAGE, @engine1.fuel_usage)
  end

  def test_max_speed()
    assert_equal(ENGINE1_MAX_SPEED, @engine1.max_speed)
  end

  def test_accelerate()
    start_speed = 15
    expected_speed = start_speed + ENGINE1_ACCELERATION
    assert_equal(expected_speed, @engine1.accelerate(start_speed))
  end

  def test_accelerate_through_max_speed()
    actual = @engine1.accelerate(ENGINE1_MAX_SPEED - 2)
    assert_equal(ENGINE1_MAX_SPEED, actual)
  end

  def test_accelerate_from_max_speed()
    actual = @engine1.accelerate(ENGINE1_MAX_SPEED)
    assert_equal(ENGINE1_MAX_SPEED, actual)
  end
end
