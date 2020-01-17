struct Series
  def initialize(@digits : String)
  end

  def largest_product(n : Int) : Int
    raise ArgumentError.new if n > @digits.size

    return 1 if n.zero?

    return @digits
      .chars
      .map(&.to_u64)
      .each_cons(n, reuse: true)
      .map(&.product)
      .max
  end
end
