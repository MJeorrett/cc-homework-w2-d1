class Engine

  attr_reader(
    :acceleration,
    :fuel_usage,
    :max_speed
  )

  def initialize(acceleration, fuel_usage, max_speed)
    @acceleration = acceleration
    @fuel_usage = fuel_usage
    @max_speed = max_speed
  end

  def accelerate(current_speed)

    if @max_speed - current_speed <= @acceleration
      return @max_speed
    else
      return current_speed + @acceleration
    end

  end

end
