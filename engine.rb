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

end
