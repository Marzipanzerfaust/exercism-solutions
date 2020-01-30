class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select do |word|
      a = @word.downcase
      b = word.downcase

      a != b && a.chars.sort == b.chars.sort
    end
  end
end
