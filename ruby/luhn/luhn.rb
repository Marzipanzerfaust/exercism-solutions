class Luhn
  def self.valid?(str)
    str.gsub!(/\s/, '')

    return false if str =~ /\D/
    return false if str.size <= 1

    seq = str.chars.map(&:to_i).reverse

    sum = seq.each_with_index.reduce(0) do |sum, (n, i)|
      if i.even?
        sum += n
      else
        n *= 2
        sum += n > 9 ? n - 9 : n
      end
    end

    return sum % 10 == 0
  end
end
