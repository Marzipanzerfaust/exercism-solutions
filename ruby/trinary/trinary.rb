module BookKeeping
  VERSION = 1
end

class Trinary
  def initialize(str)
    @str = str
  end

  def to_decimal
    @str.reverse.chars.each_with_index.reduce(0) do |dec, (digit, i)|
      digit =~ /[012]/ ? dec += digit.to_i * 3 ** i : 0
    end
  end
end
