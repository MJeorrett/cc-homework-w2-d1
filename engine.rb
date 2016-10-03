class Engine

  attr_reader(
    :acceleration_speed_increase,
    :acceleration_fuel_usage,
    :max_speed
  )

  def initialize(acceleration_speed_increase, acceleration_fuel_usage, max_speed)
    @acceleration_speed_increase = acceleration_speed_increase
    @acceleration_fuel_usage = acceleration_fuel_usage
    @max_speed = max_speed
  end

  def accelerate(current_speed)

    if current_speed == @max_speed
      return "Already at max speed!"
    elsif @max_speed - current_speed <= @acceleration_speed_increase
      return @max_speed
    else
      return current_speed + @acceleration_speed_increase
    end

  end

  def reduce_speed(speed_decrease)
    @speed -= speed_decrease
  end

end
