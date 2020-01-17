module Binary
  def self.to_decimal(str)
    dec = 0

    str.chars.reverse.each.with_index do |digit, i|
      raise ArgumentError if digit !~ /[01]/

      dec += digit.to_i * 2 ** i
    end

    return dec
  end
end
