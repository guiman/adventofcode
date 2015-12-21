require 'house'

class Movement
  attr_reader :x_movement, :y_movement

  def initialize(x_movement, y_movement)
    @x_movement = x_movement
    @y_movement = y_movement
  end

  def from(house)
    House.new(house.x + x_movement, house.y + y_movement)
  end
end
