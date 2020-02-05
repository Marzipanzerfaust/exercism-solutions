module Acronym
  def self.abbreviate(string)
    string
      .gsub(/\W/, ' ')
      .split.map { |word| word[0] }
      .join.upcase
  end
end
