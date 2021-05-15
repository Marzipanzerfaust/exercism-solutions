module Pangram
  ALPHABET = ('a'..'z').to_a

  def self.pangram?(str)
    str
      .downcase
      .each_char
      .select(&.ascii_lowercase?)
      .uniq
      .to_a
      .sort == ALPHABET
  end
end
