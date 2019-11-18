module BookKeeping
  VERSION = 3
end

class Binary
  def self.to_decimal(str)
    str.reverse.chars.each_with_index.reduce(0) do |dec, (digit, i)|
      if !(digit =~ /[01]/)
        raise ArgumentError
      else
        dec += digit.to_i * 2 ** i
      end
    end
  end

  def self.to_binary(str)
    # Divide by 2 method
    dec = str.to_i
    bin = ''

    loop do
      quo, rem = dec.divmod(2)
      bin = rem.to_s + bin
      dec = quo
      break if quo == 0
    end

    return bin
  end
end
