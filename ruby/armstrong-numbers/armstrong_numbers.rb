module ArmstrongNumbers
  def self.include?(n)
    str = n.to_s
    return n == str.chars.sum { |char| char.to_i ** str.size }
  end
end
