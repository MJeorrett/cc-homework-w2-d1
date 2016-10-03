require('minitest/autorun')
require('minitest/rg')
require_relative('../car')
require('pry-byebug')

class CarTest < MiniTest::Test

  def setup()
    @car1 = Car.new("Honda", "Accord")
  end

  def test_make()
    assert_equal("Honda", @car1.make)
  end

  def test_model()
    assert_equal("Accord", @car1.model)
  end

  def test_initialized_fuel_level()
    assert_equal(100, @car1.fuel_level)
  end

  def test_initialized_speed()
    assert_equal(0, @car1.speed)
  end

  # def test_run_out_of_fuel()
  #   number_of_accelerations = (Car::MAX_FUEL / Car::ACCELERATE_FUEL_USAGE).floor
  #   number_of_accelerations.times do
  #     @car1.accelerate
  #   end
  #
  #   assert_equal("Not enough fuel to accelerate again!", @car1.accelerate)
  # end

  def test_refuel()
    while @car1.fuel_level >= Car::ACCELERATE_FUEL_USAGE
      @car1.accelerate
    end
    @car1.refuel
    assert_equal(Car::MAX_FUEL, @car1.fuel_level)
  end

  def test_dont_brake_below_zero()
    @car1.brake
    assert_equal(0, @car1.speed)
    assert_equal(Car::MAX_FUEL, @car1.fuel_level)
  end

  def test_brake_when_moving()
    @car1.accelerate
    @car1.accelerate
    @car1.brake
    expected_speed = (Car::ACCELERATE_SPEED_INCREASE * 2) - Car::BRAKE_SPEED_DECREASE
    assert_equal(expected_speed, @car1.speed)
  end

end
