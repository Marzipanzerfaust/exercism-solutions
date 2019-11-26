class ArmstrongNumbers
  def self.armstrong_number?(n : Int) : Bool
    str = n.to_s

    return str
      .chars
      .reduce(0) { |sum, c| sum + c.to_i ** str.size } == n
  end
end
