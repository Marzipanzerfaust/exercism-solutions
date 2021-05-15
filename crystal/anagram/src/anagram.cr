class String
  def anagram_of?(other : self) : Bool
    a = self.downcase
    b = other.downcase

    return a != b && a.chars.sort == b.chars.sort
  end
end

module Anagram
  def self.find(str, arr)
    arr.select(&.anagram_of?(str))
  end
end
