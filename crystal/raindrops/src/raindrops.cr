# Please implement your solution to raindrops in this file
class Raindrops
  def self.drops(n : Int32) : String
    output = ""

    output += "Pling" if n.divisible_by?(3)
    output += "Plang" if n.divisible_by?(5)
    output += "Plong" if n.divisible_by?(7)
    output += n.to_s if output.empty?

    return output
  end
end
