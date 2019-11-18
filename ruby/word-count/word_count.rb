class Phrase
  attr_reader :word_count

  def initialize(phrase)
    @word_count = Hash.new(0)
    phrase.downcase.gsub(/(\W')|('\W)/, ' ').split(/[^\w']/).each do |word|
      @word_count[word] += 1 if word.length > 0
    end
  end
end
