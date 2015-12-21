class WrappingPaper
  def initialize(input)
    @input = input
  end

  def square_foot
    base_calculation + slack
  end

  def slack
    measures = input_to_array
    measures.delete_at(measures.index(measures.max))
    measures.reduce(:*)
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
