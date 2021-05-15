module RunLengthEncoding
  def self.encode(string)
    string.gsub(/(.)\1*/) { "#{$0.size if $0.size != 1}#{$1}" }
  end

  def self.decode(string)
    string.gsub(/(\d+)?(\D)/) do
      if $1?
        $2 * $1.to_i
      else
        $2
      end
    end
  end
end
