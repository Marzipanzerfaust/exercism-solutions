class String
  def anagram_of?(other : self) : Bool
    a = self.downcase
    b = other.downcase

    return a.chars.sort == b.chars.sort && a != b
  end
end

module Anagram
  def self.find(str : String, arr : Array(String)) : Array(String)
    arr.select(&.anagram_of?(str))
  end
end
