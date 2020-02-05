module Isogram
  def self.isogram?(str)
    str = str.gsub(/\W/, nil).downcase
    return str.chars == str.chars.uniq
  end
end
