require('pry-byebug')

class Car

  MAX_FUEL = 100

  ACCELERATE_FUEL_USAGE = 5

  ACCELERATE_SPEED_INCREASE = 10

  BRAKE_SPEED_DECREASE = 9

  MAX_SPEED = 151

  attr_reader(:make, :model, :fuel_level, :speed)

  def initialize(make, model)
    @make = make
    @model = model
    @fuel_level = MAX_FUEL
    @speed = 0
  end

  def accelerate()
    # reduce fuel
    if ACCELERATE_FUEL_USAGE > @fuel_level
      return "Not enough fuel to accelerate again!"
    else
      @fuel_level -= ACCELERATE_FUEL_USAGE
    end

    # increase speed
    if @speed == MAX_SPEED
      return "Already at max speed!"
    elsif MAX_SPEED - @speed <= ACCELERATE_SPEED_INCREASE
      @speed = MAX_SPEED
    else
      @speed += ACCELERATE_SPEED_INCREASE
    end

  end

  def brake()
    if @speed >= BRAKE_SPEED_DECREASE
      @speed -= BRAKE_SPEED_DECREASE
    else
      @speed = 0
    end
  end

  def refuel()
    @fuel_level = MAX_FUEL
  end
end
