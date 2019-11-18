# Please implement your solution to leap in this file
struct Year
  def self.leap?(year : UInt16) : Bool
    year.divisible_by?(4) && !year.divisible_by?(100) || year.divisible_by?(400)
  end
end
