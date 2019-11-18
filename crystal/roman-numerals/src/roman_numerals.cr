# Please implement your solution to roman-numerals in this file
struct Int
  ROMAN_NUMERALS = {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  def to_roman
    output = ""
    decimal = self

    ROMAN_NUMERALS.keys.reverse.each do |x|
      quotient, remainder = decimal.divmod(x)
      decimal = remainder
      output += ROMAN_NUMERALS[x] * quotient
    end

    return output
  end
end
