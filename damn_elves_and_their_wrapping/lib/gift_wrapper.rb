class GiftWrapper
  def initialize(input)
    @input = input
  end

  def total_ribbon_length
    ribbon_length + bow_length
  end

  def ribbon_length
    shortes_sides.first * 2 + shortes_sides.last * 2
  end

  def bow_length
    input_to_array.reduce(:*)
  end

  def square_foot
    base_calculation + slack
  end

  def slack
    shortes_sides.reduce(:*)
  end

  def shortes_sides
    measures = input_to_array
    measures.delete_at(measures.index(measures.max))
    measures
  end

  def parsed_input
    data = input_to_array
    { l:data[0], w:data[1], h:data[2] }
  end

  def input_to_array
    @input.split("x").map(&:to_i)
  end

  def base_calculation
    dimensions = parsed_input
    2 * dimensions.fetch(:l) * dimensions.fetch(:w) + 2 * dimensions.fetch(:w) * dimensions.fetch(:h) + 2 * dimensions.fetch(:h) * dimensions.fetch(:l)
  end
end
