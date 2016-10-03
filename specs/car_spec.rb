require('minitest/autorun')
require('minitest/rg')
require_relative('../car')
require('pry-byebug')

class CarTest < MiniTest::Test

  def setup()
    @engine1_acceleration = 10
    @engine1_fuel_usage = 5
    @engine1_max_speed = 151

    @engine1 = Engine.new(
      @engine1_acceleration,
      @engine1_fuel_usage,
      @engine1_max_speed
    )

    @car1_make = "Honda"
    @car1_model = "Accord"
    @car1_brake_power = 9
    @car1_max_fuel = 100
    @car1 = Car.new(@car1_make, @car1_model, @engine1, @car1_brake_power, @car1_max_fuel)
  end

  def test_make()
    assert_equal(@car1_make, @car1.make)
  end

  def test_model()
    assert_equal(@car1_model, @car1.model)
  end

  def test_brake_power()
    assert_equal(@car1_brake_power, @car1.brake_power)
  end

  def test_max_fuel()
    assert_equal(@car1_max_fuel, @car1.max_fuel)
  end

  def test_initial_fuel_level()
    assert_equal(100, @car1.fuel_level)
  end

  def test_initial_speed()
    assert_equal(0, @car1.speed)
  end

  def test_run_out_of_fuel()
    number_of_accelerations = (@car1_max_fuel / @engine1_fuel_usage).floor
    number_of_accelerations.times do
      @car1.accelerate
    end

    assert_equal(Car::RUN_OUT_OF_FUEL_MESSAGE, @car1.accelerate)
  end

  def test_accelerate()
    @car1.accelerate
    expected_speed = @engine1_acceleration
    expected_fuel = @car1_max_fuel - @engine1_fuel_usage
    assert_equal(expected_speed, @car1.speed)
    assert_equal(expected_fuel, @car1.fuel_level)
  end

  def test_accelerate_through_max_speed()
    #accelerate till we are less than one more acceleration away from top speed.
    until @car1.speed >= @engine1_max_speed
      @car1.accelerate()
    end

    @car1.accelerate()

    assert_equal(@engine1_max_speed, @car1.speed)
  end

  def test_refuel()
    while @car1.fuel_level >= @engine1_fuel_usage
      @car1.accelerate
    end
    @car1.refuel
    assert_equal(@car1_max_fuel, @car1.fuel_level)
  end

  def test_dont_brake_below_zero()
    @car1.brake
    assert_equal(0, @car1.speed)
    assert_equal(@car1_max_fuel, @car1.fuel_level)
  end

  def test_brake_when_moving()
    @car1.accelerate
    @car1.accelerate
    @car1.brake
    expected_speed = (@engine1_acceleration * 2) - @car1_brake_power
    assert_equal(expected_speed, @car1.speed)
  end

end
