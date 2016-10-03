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

    if current_speed == @max_speed
      return "Already at max speed!"
    elsif @max_speed - current_speed <= @acceleration
      return @max_speed
    else
      return current_speed + @acceleration
    end

  end

  def reduce_speed(speed_decrease)
    @speed -= speed_decrease
  end

end
