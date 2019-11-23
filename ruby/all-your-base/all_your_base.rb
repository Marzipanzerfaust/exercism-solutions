# NOTE: Forgoing the use of Integer#to_s

class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base < 2 || output_base < 2

    return from_i(to_i(digits, input_base), output_base)
  end

  def self.to_i(digits, input_base)
    digits.reverse.each.with_index.sum do |d, i|
      if !(0...input_base).include?(d)
        raise ArgumentError
      else
        d * input_base ** i
      end
    end
  end

  def self.from_i(n, output_base)
    out = []

    loop do
      div, mod = n.divmod(output_base)
      n = div
      out.prepend(mod)

      break if n == 0
    end

    return out
  end
end
