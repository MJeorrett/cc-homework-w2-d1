class Car

  STARTING_FUEL = 100
  ACCELERATE_FUEL_USAGE = 5
  ACCELERATE_SPEED_INCREASE = 10
  BRAKE_SPEED_DECREASE = 10

  attr_reader(:make, :model, :fuel_level, :speed)

  def initialize(make, model)
    @make = make
    @model = model
    @fuel_level = STARTING_FUEL
    @speed = 0
  end

  def accelerate()
    if @fuel_level >= ACCELERATE_FUEL_USAGE
      @fuel_level -= ACCELERATE_FUEL_USAGE
      @speed += ACCELERATE_SPEED_INCREASE
    else
      return "Out of fuel!"
    end
  end

  def brake()
    if @speed >= BRAKE_SPEED_DECREASE
      @speed -= BRAKE_SPEED_DECREASE
    else
      @speed = 0
    end
  end
end
