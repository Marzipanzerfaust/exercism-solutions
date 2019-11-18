class RunLengthEncoding
  def self.encode(string : String)
    string.gsub(/(.)\1*/) { |match| "#{match.size if match.size != 1}#{$1}" }
  end

  def self.decode(string : String)
    string.gsub(/(\d+)?(\D)/) do
      begin
        $2 * $1.to_i
      rescue IndexError
        $2
      end
    end
  end
end
