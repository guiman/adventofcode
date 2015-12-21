require 'house'
require 'movement'

class SantaHouseCounter
  MOVEMENTS = {
    '^' => Movement.new(0,1),
    'v' => Movement.new(0,-1),
    '<' => Movement.new(-1,0),
    '>' => Movement.new(1,0)
  }

  def initialize(input)
    @input = input
  end

  def count_houses
    current_position = House.new(0,0)
    houses = { current_position => 1 }

    movements.each do |movement|
      current_position = movement.from(current_position)
      houses[current_position] ||= 0
      houses[current_position] += 1
    end

    houses.keys.count
  end

  def movements
    @input.split("").map do |char|
      MOVEMENTS[char]
    end
  end
end
