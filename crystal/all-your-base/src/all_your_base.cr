module AllYourBase
  def self.rebase(input_base, digits, output_base)
    raise ArgumentError.new if input_base < 2 || output_base < 2

    return from_i(to_i(digits, input_base), output_base)
  end

  def self.to_i(digits, input_base)
    digits.reverse_each.with_index.sum do |d, i|
      if d.in?(0...input_base)
        d * input_base ** i
      else
        raise ArgumentError.new
      end
    end
  end

  def self.from_i(n, output_base)
    out = [] of Int32

    loop do
      div, mod = n.divmod(output_base)
      n = div
      out.unshift(mod)

      break if n == 0
    end

    out
  end
end
