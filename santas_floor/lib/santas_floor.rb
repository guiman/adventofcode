class SantasFloor
  def initialize(input)
    @input = input
  end

  def floor
    decode_input.reduce(:+)
  end

  def decode_input
    @input.split("").map { |char| (char == '(' ? 1 : -1) }
  end

  def first_time_on_basement
    @input.size.times do |i|
      parser = self.class.new(@input.byteslice(0, i))
      return i if parser.floor == -1
    end
  end
end
