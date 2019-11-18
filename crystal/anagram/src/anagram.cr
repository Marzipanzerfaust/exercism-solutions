# Please implement your solution to anagram in this file
struct Anagram
  def self.is_anagram?(a : String, b : String)
    a = a.downcase
    b = b.downcase
    return a.chars.sort == b.chars.sort && a != b
  end

  def self.find(str : String, arr : Array(String))
    arr.select { |string| self.is_anagram?(str, string) }
  end
end
