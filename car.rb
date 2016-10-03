require('pry-byebug')
require_relative('engine')

class Car

  MAX_FUEL = 100
  BRAKE_SPEED_DECREASE = 9

  attr_reader(:make, :model, :engine, :fuel_level)

  def initialize(make, model, engine)
    @make = make
    @model = model
    @engine = engine
    @fuel_level = MAX_FUEL
  end

  def brake()
    @engine.brake(BRAKE_SPEED_DECREASE)
  end

  def accelerate()
    # fuel usage
    if Engine::ACCELERATE_FUEL_USAGE > @fuel_level
      return "Not enough fuel to accelerate again!"
    else
      @fuel_level -= Engine::ACCELERATE_FUEL_USAGE
    end

    return engine.accelerate()
  end

  def refuel()
    @fuel_level = MAX_FUEL
  end

  def speed
    return @engine.speed()
  end
end
