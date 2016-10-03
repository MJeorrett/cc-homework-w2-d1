require('minitest/autorun')
require('minitest/rg')
require_relative('../engine')
require('pry-byebug')

class EngineTest < MiniTest::Test

  def setup
    @engine1_acceleration_speed_increase = 10
    @engine1_acceleration_fuel_usage = 5
    @engine1_max_speed = 151

    @engine1 = Engine.new(
      @engine1_acceleration_speed_increase,
      @engine1_acceleration_fuel_usage,
      @engine1_max_speed
    )
  end

  def test_engine_acceleration_speed_increase()
    assert_equal(@engine1_acceleration_speed_increase, @engine1.acceleration_speed_increase)
  end

  def test_engine_acceleration_fuel_usage()
    assert_equal(@engine1_acceleration_fuel_usage, @engine1.acceleration_fuel_usage)
  end

  def test_max_speed()
    assert_equal(@engine1_max_speed, @engine1.max_speed)
  end

end
