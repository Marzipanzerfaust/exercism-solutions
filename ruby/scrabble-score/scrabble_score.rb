class Scrabble
  attr_reader :score

  def initialize(str)
    @score = Scrabble.score(str)
  end

  def self.score(str)
    return 0 if str.nil?

    str.upcase.gsub(/[^[:alpha:]]/, "").chars.sum do |char|
      case char
      when /[AEIOULNRST]/
        1
      when /[DG]/
        2
      when /[BCMP]/
        3
      when /[FHVWY]/
        4
      when "K"
        5
      when /[JX]/
        8
      when /[QZ]/
        10
      end
    end
  end
end
