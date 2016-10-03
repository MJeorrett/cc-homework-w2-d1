require('minitest/autorun')
require('minitest/rg')
require_relative('../car')

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

  def test_accelerate()
    @car1.accelerate
    assert_equal(10, @car1.speed)
    assert_equal(95, @car1.fuel_level)
    @car1.accelerate
    assert_equal(20, @car1.speed)
    assert_equal(90, @car1.fuel_level)
  end

  def test_run_out_of_fuel()
    number_of_accelerations = (Car::STARTING_FUEL / Car::ACCELERATE_FUEL_USAGE).floor
    number_of_accelerations.times do
      @car1.accelerate
    end

    assert_equal("Out of fuel!", @car1.accelerate)
  end

  def test_brake_when_stopped()
    @car1.brake
    assert_equal(0, @car1.speed)
    assert_equal(100, @car1.fuel_level)
  end

  def test_brake_when_moving()
    @car1.accelerate
    @car1.accelerate
    @car1.brake
    assert_equal(10, @car1.speed)
  end

end
