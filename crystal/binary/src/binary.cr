module Binary
  def self.to_decimal(str)
    str.reverse.each_char.with_index.sum do |digit, i|
      raise ArgumentError.new unless digit.to_i?(2)

      digit.to_i * 2 ** i
    end
  end
end
