require('minitest/autorun')
require('minitest/rg')
require_relative('../car')
require('pry-byebug')

class CarTest < MiniTest::Test

  CAR1_MAKE = "Honda"
  CAR1_MODEL = "Accord"
  CAR1_BRAKE_POWER = 9
  CAR1_MAX_FUEL = 100

  ENGINE1_ACCELERATION = 10
  ENGINE1_FUEL_USAGE = 5
  ENGINE1_MAX_SPEED = 123

  def setup()

    @engine1 = Engine.new(
      ENGINE1_ACCELERATION,
      ENGINE1_FUEL_USAGE,
      ENGINE1_MAX_SPEED
    )

    @car1 = Car.new(CAR1_MAKE, CAR1_MODEL, @engine1, CAR1_BRAKE_POWER, CAR1_MAX_FUEL)
  end

  def test_make()
    assert_equal(CAR1_MAKE, @car1.make)
  end

  def test_model()
    assert_equal(CAR1_MODEL, @car1.model)
  end

  def test_brake_power()
    assert_equal(CAR1_BRAKE_POWER, @car1.brake_power)
  end

  def test_max_fuel()
    assert_equal(CAR1_MAX_FUEL, @car1.max_fuel)
  end

  def test_initial_fuel_level()
    assert_equal(100, @car1.fuel_level)
  end

  def test_initial_speed()
    assert_equal(0, @car1.speed)
  end

  def test_run_out_of_fuel()
    number_of_accelerations = (CAR1_MAX_FUEL / ENGINE1_FUEL_USAGE).floor
    number_of_accelerations.times do
      @car1.accelerate
    end

    assert_equal(Car::RUN_OUT_OF_FUEL_MESSAGE, @car1.accelerate)
  end

  def test_accelerate()
    @car1.accelerate
    expected_speed = ENGINE1_ACCELERATION
    expected_fuel = CAR1_MAX_FUEL - ENGINE1_FUEL_USAGE
    assert_equal(expected_speed, @car1.speed)
    assert_equal(expected_fuel, @car1.fuel_level)
  end

  def test_accelerate_through_max_speed()
    #accelerate till we are less than one more acceleration away from top speed.
    until @car1.speed >= ENGINE1_MAX_SPEED
      @car1.accelerate()
    end

    @car1.accelerate()

    assert_equal(ENGINE1_MAX_SPEED, @car1.speed)
  end

  def test_refuel()
    while @car1.fuel_level >= ENGINE1_FUEL_USAGE
      @car1.accelerate
    end
    @car1.refuel
    assert_equal(CAR1_MAX_FUEL, @car1.fuel_level)
  end

  def test_dont_brake_below_zero()
    @car1.brake
    assert_equal(0, @car1.speed)
    assert_equal(CAR1_MAX_FUEL, @car1.fuel_level)
  end

  def test_brake_when_moving()
    @car1.accelerate
    @car1.accelerate
    @car1.brake
    expected_speed = (ENGINE1_ACCELERATION * 2) - CAR1_BRAKE_POWER
    assert_equal(expected_speed, @car1.speed)
  end

end
