class Integer
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def to_roman
    output = []
    n = self

    ROMAN_NUMERALS.each do |roman, decimal|
      quotient, n = n.divmod(decimal)
      output << roman * quotient
    end

    return output.join
  end
end
