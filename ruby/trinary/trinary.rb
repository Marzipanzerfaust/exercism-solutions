class Trinary
  def initialize(str)
    @str = str
  end

  def to_decimal
    dec = 0

    @str.chars.reverse.each.with_index do |digit, i|
      return 0 if digit !~ /[012]/

      dec += digit.to_i * 3 ** i
    end

    return dec
  end
end
