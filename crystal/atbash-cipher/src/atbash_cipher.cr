module Atbash
  ALPHABET = ('a'..'z').join

  def self.encode(input : String) : String
    input
      .downcase
      .gsub(/\W/, nil)
      .tr(ALPHABET, ALPHABET.reverse)
      .each_char
      .slice(5)
      .map(&.join)
      .join(' ')
  end
end
