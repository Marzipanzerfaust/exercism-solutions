class ArmstrongNumbers
  def self.include?(n)
    str = n.to_s
    p = str.size

    return n == str.chars.reduce(0) { |sum, char| sum + char.to_i ** p }
  end
end
