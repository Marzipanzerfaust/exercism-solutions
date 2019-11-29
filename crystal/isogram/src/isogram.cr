class Isogram
  def self.isogram?(str)
    str = str.gsub(/\W/, "").downcase
    return str.chars == str.chars.uniq
  end
end
