module Pangram
  ALPHABET = ('a'..'z').to_a

  def self.pangram?(str : String) : Bool
    str
      .downcase
      .gsub(/[^a-z]/, nil)
      .chars
      .uniq
      .sort == ALPHABET
  end
end
