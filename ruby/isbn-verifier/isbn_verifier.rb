class IsbnVerifier
  def self.valid?(str)
    str.gsub!("-", "")

    return false unless str =~ /\A\d{9}[\dX]\z/

    sum = str.chars.reverse.each_with_index.reduce(0) do |sum, (c, i)|
      if i == 0 && c == 'X'
        sum += 10
      else
        sum += c.to_i * (i + 1)
      end
    end

    return sum % 11 == 0
  end
end
