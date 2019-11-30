class AllYourBase
  def self.rebase(input_base : Int, digits : Array(Int), output_base : Int) : Array(Int32)
    raise ArgumentError.new if input_base < 2 || output_base < 2

    return from_i(to_i(digits, input_base), output_base)
  end

  def self.to_i(digits : Array(Int), input_base : Int) : Int
    digits.reverse.each.with_index.sum do |d, i|
      if !(0...input_base).includes?(d)
        raise ArgumentError.new
      else
        d * input_base ** i
      end
    end
  end

  def self.from_i(n : Int, output_base : Int) : Array(Int32)
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
