class Scrabble
  attr_reader :score

  def initialize(str)
    @score = Scrabble.score(str)
  end

  def self.score(str)
    return 0 if str.nil?

    str.upcase.gsub(/\W/, '').chars.reduce(0) do |sum, char|
      case char
      when /[AEIOULNRST]/
        sum += 1
      when /[DG]/
        sum += 2
      when /[BCMP]/
        sum += 3
      when /[FHVWY]/
        sum += 4
      when 'K'
        sum += 5
      when /[JX]/
        sum += 8
      when /[QZ]/
        sum += 10
      end
    end
  end
end
