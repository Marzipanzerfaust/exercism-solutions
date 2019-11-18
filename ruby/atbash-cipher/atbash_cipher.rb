class Atbash
  LETTERS = ('a'..'z').to_a
  NUMBERS = ('0'..'9').to_a

  KEY = Hash[LETTERS.zip(LETTERS.reverse)]
    .merge Hash[NUMBERS.zip(NUMBERS)]

  def self.encode(str)
    str
      .gsub(/\W/, '')
      .downcase
      .chars
      .each_slice(5)
      .map { |slice| slice.map { |char| KEY[char] }.join }
      .join(' ')
  end
end
