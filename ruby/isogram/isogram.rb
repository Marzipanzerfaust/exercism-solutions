class Isogram
  def self.isogram?(input)
    input
      .downcase.gsub(/\W/, '')
      .chars.each_with_object(Hash.new(0)) { |char, counter| counter[char] += 1 }
      .values.none? { |v| v > 1 }
  end
end
