module Darts
  def self.score(x : Float, y : Float) : Int
    case Math.sqrt(x**2 + y**2).ceil
    when 0..1
      10
    when 2..5
      5
    when 6..10
      1
    else
      0
    end
  end
end
