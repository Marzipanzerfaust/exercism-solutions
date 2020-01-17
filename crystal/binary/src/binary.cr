module Binary
  def self.to_decimal(str : String) : Int
    dec = 0

    str.reverse.each_char.with_index do |digit, i|
      raise ArgumentError.new unless digit.to_i?(2)

      dec += digit.to_i * 2 ** i
    end

    return dec
  end
end
