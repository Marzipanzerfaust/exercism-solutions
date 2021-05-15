struct Series
  def initialize(@digits : String) end

  def largest_product(n)
    raise ArgumentError.new if n > @digits.size

    return 1 if n.zero?

    return @digits
      .each_char
      .map(&.to_u64)
      .cons(n, true)
      .map(&.product)
      .max
  end
end
