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

  def count_houses_with_robot
    initial_house = House.new(0,0)
    real_santa_position = initial_house
    robot_1_position = initial_house
    houses = { initial_house => 2 }

    movements.each_with_index do |movement, index|
      if index % 2 == 0
        current_position = movement.from(real_santa_position)
        real_santa_position = current_position
      else
        current_position = movement.from(robot_1_position)
        robot_1_position = current_position
      end

      houses[current_position] ||= 0
      houses[current_position] += 1
    end

    houses.keys.count
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
