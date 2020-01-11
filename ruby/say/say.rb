class Say
  PRIMITIVES = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    10 ** 2 => "hundred",
    10 ** 3 => "thousand",
    10 ** 6 => "million",
    10 ** 9 => "billion"
  }

  def initialize(n)
    raise ArgumentError unless n.between?(0, 999_999_999_999)

    @number = n
  end

  def in_english
    Say.translate(@number)
  end

  def self.translate(n)
    if n < 100
      return PRIMITIVES[n] if PRIMITIVES.include?(n)

      PRIMITIVES.keys.reverse.each do |unit|
        next if unit >= 100

        div, n = n.divmod(unit)

        if div > 0
          return "#{PRIMITIVES[unit]}-#{PRIMITIVES[n]}"
        end
      end
    else
      return "one #{PRIMITIVES[n]}" if PRIMITIVES.include?(n)
    end

    terms = []

    PRIMITIVES.keys.reverse.each do |unit|
      break if unit == 0

      div, n = n.divmod(unit)

      if div > 0
        terms << translate(div)
        terms << PRIMITIVES[unit]
        break
      end
    end

    terms << translate(n)

    return terms.join(" ")
  end
end
