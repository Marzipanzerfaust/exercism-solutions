class Triangle
  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    valid? && @sides.uniq.size == 1
  end

  def isosceles?
    valid? && @sides.uniq.size <= 2
  end

  def scalene?
    valid? && @sides.uniq.size == 3
  end

  private

  def valid?
    a, b, c = @sides

    return @sides.all? { |s| s > 0 } && a + b >= c
  end
end
