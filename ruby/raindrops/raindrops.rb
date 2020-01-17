class Integer
  def divisible_by?(other)
    self % other == 0
  end
end

module Raindrops
  def self.convert(n)
    output = []

    output << "Pling" if n.divisible_by?(3)
    output << "Plang" if n.divisible_by?(5)
    output << "Plong" if n.divisible_by?(7)

    output << n.to_s if output.empty?

    return output.join
  end
end
