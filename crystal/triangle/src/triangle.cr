# Please implement your solution to triangle in this file
struct Triangle
  def initialize(@sides : Array(Int32))
  end

  def equilateral?
    valid? && @sides.to_set.size == 1 && @sides.none? { |s| s == 0 }
  end

  def isosceles?
    valid? && @sides.to_set.size <= 2
  end

  def scalene?
    valid? && @sides.to_set.size == 3
  end

  private def valid?
    sorted = @sides.sort
    return sorted.first(2).sum > sorted.last
  end
end
