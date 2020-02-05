module Isogram
  def self.isogram?(input)
    chars = input.downcase.gsub(/\W/, "").chars
    return chars.size == chars.uniq.size
  end
end
