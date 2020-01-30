# Inspired by Crystal's Enumerable#tally
module Enumerable
  def tally
    each.with_object(Hash.new(0)) do |item, hash|
      hash[item] += 1
    end
  end
end

class Phrase
  attr_reader :word_count

  def initialize(phrase)
    @word_count = phrase
      .downcase
      .gsub(/[^\w']/, " ")
      .gsub(/\s'|'\s/, " ")
      .split
      .tally
  end
end
