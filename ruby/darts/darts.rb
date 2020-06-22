class Darts
  def initialize(x, y)
    @x, @y = x, y
  end

  def score
    distance = Math.sqrt(@x ** 2 + @y ** 2)

    if distance > 10
      0
    elsif distance > 5
      1
    elsif distance > 1
      5
    else
      10
    end
  end
end
