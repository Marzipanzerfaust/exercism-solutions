struct Triangle
  @is_valid : Bool
  @is_equilateral : Bool
  @is_isosceles : Bool
  @is_scalene : Bool
  @sides : Array(Int32)

  def initialize(@sides)
    sorted = @sides.sort
    @is_valid = sorted.first(2).sum > sorted.last

    if @is_valid
      unique = @sides.uniq.size

      @is_equilateral = unique == 1 && @sides.none?(&.zero?)
      @is_isosceles = unique <= 2
      @is_scalene = unique == 3
    else
      @is_equilateral = @is_isosceles = @is_scalene = false
    end
  end

  def equilateral?
    @is_equilateral
  end

  def isosceles?
    @is_isosceles
  end

  def scalene?
    @is_scalene
  end
end
