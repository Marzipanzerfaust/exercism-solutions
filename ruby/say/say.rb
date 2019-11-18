class Say
  ENGLISH = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

  def initialize(number)
    raise ArgumentError if number < 0 || number >= 10 ** 12

    @number = number
  end

  def in_english
    return 'zero' if @number == 0

    n = @number

    billions, n = n.divmod(10 ** 9)
    millions, n = n.divmod(10 ** 6)
    thousands, n = n.divmod(10 ** 3)
    hundreds, n = n.divmod(10 ** 2)
  end
end
