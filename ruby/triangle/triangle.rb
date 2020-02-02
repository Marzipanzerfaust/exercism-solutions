class Triangle
  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    valid? && unique_sides == 1
  end

  def isosceles?
    valid? && unique_sides <= 2
  end

  def scalene?
    valid? && unique_sides == 3
  end

  def valid?
    a, b, c = @sides

    return @sides.all? { |s| s > 0 } && a + b >= c
  end

  def unique_sides
    @sides.uniq.size
  end
end
