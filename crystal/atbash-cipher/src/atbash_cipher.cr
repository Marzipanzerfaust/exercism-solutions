module Atbash
  ALPHABET = ('a'..'z').join
  REVERSED = ALPHABET.reverse

  def self.encode(input)
    input
      .downcase
      .gsub(/\W/, nil)
      .tr(ALPHABET, REVERSED)
      .each_char
      .slice(5)
      .map(&.join)
      .join(' ')
  end
end
