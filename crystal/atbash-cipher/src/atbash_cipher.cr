module Atbash
  ALPHABET = ('a'..'z').join

  def self.encode(input : String) : String
    input
      .downcase
      .gsub(/\W/, nil)
      .tr(ALPHABET, ALPHABET.reverse)
      .chars
      .each_slice(5)
      .map(&.join)
      .join(' ')
  end
end
