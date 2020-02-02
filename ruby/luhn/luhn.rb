module Luhn
  def self.valid?(str)
    str = str.gsub(/\s/, '')

    return false if str =~ /\D/
    return false if str.size < 2

    digits = str.chars.map(&:to_i).reverse

    sum = digits.each.with_index.sum do |n, i|
      if i.even?
        n
      else
        n *= 2

        if n > 9
          n - 9
        else
          n
        end
      end
    end

    return sum % 10 == 0
  end
end
