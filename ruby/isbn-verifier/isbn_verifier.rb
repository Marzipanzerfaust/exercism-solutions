module IsbnVerifier
  def self.valid?(str)
    str = str.gsub("-", "")

    return false if str !~ /\A\d{9}[\dX]\z/

    total = str.each_char.reverse_each.with_index.sum do |c, i|
      if i == 0 && c == "X"
        10
      else
        c.to_i * (i + 1)
      end
    end

    return total % 11 == 0
  end
end
