module Atbash
  ALPHABET = ('a'..'z').to_a.join

  def self.encode(input)
    input
      .downcase
      .gsub(/\W/, "")
      .tr(ALPHABET, ALPHABET.reverse)
      .chars
      .each_slice(5)
      .map(&:join)
      .join(' ')
  end
end
