require 'set'

class Pangram
  def self.pangram?(string)
    alphabet = ('a'..'z').to_a
    Set.new(string.downcase.split('').reject { |char| !alphabet.include?(char) }).to_a.sort == alphabet
  end
end
