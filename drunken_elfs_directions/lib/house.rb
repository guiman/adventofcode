class House
  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def ==(other)
    self.x == other.x && self.y == other.y
  end

  alias eql? ==

  def to_s
    "(#{x},#{y})"
  end

  def hash
    self.to_s.hash
  end
end
