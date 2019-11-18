# 1/22/2018: More feedback from tenebrousedge

module BookKeeping
  VERSION = 3
end

class RunLengthEncoding
  def self.encode(string)
    string.gsub(/(.)\1*/) { |match| "#{match.length if match.length != 1}#{$1}" }
  end

  def self.decode(string)
    string.gsub(/(\d+)?(\D)/) { $1.nil? ? $2 : $2 * $1.to_i }
  end
end
