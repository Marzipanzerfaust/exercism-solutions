module Raindrops
  def self.drops(n : Int) : String
    output = [] of String

    output << "Pling" if n.divisible_by?(3)
    output << "Plang" if n.divisible_by?(5)
    output << "Plong" if n.divisible_by?(7)
    output << n.to_s if output.empty?

    return output.join
  end
end
