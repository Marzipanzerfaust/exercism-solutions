class IsbnVerifier
  def self.valid?(str : String) : Bool
    str = str.gsub("-", "")

    return false unless str =~ /\A\d{9}[\dX]\z/

    total = str.reverse.each_char.with_index.sum do |c, i|
      if c == 'X'
        10
      else
        c.to_i * (i + 1)
      end
    end

    return total % 11 == 0
  end
end
