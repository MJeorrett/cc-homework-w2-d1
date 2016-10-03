require('pry-byebug')
require_relative('engine')

class Car

  RUN_OUT_OF_FUEL_MESSAGE = "Out of fuel!"

  attr_reader(
    :make,
    :model,
    :engine,
    :brake_power,
    :max_fuel,
    :speed,
    :fuel_level
  )

  def initialize(make, model, engine, brake_power, max_fuel)
    @make = make
    @model = model
    @engine = engine
    @brake_power = brake_power
    @max_fuel = max_fuel
    @speed = 0
    @fuel_level = @max_fuel
  end

  def brake()
    if @speed < @brake_power
      @speed = 0
    else
      @speed -= @brake_power
    end
  end

  def accelerate()

    # fuel usage
    if @engine.fuel_usage > @fuel_level
      return RUN_OUT_OF_FUEL_MESSAGE
    else
      @fuel_level -= @engine.fuel_usage
    end

    @speed = @engine.accelerate(@speed)
  end

  def refuel()
    @fuel_level = @max_fuel
  end
end
