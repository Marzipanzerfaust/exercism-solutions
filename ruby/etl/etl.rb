module ETL
  def self.transform(input)
    input.each.with_object({}) do |(score, letters), output|
      letters.each { |letter| output[letter.downcase] = score }
    end
  end
end
