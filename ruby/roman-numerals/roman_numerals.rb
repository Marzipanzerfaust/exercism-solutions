class Fixnum
  def to_roman
    string = ''
    int = self

    romans = %w(M CM D CD C XC L XL X IX V IV I)
    decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

    romans.zip(decimals).each_with_index do |pair, i|
      roman, decimal = pair
      quotient, remainder = int.divmod(decimal)

      string += roman * quotient
      int = remainder
    end

    return string
  end
end

module BookKeeping
  VERSION = 2
end
