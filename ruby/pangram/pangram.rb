module Pangram
  ALPHABET = ("a".."z").to_a

  def self.pangram?(str)
    (ALPHABET - str.downcase.chars).empty?
  end
end
