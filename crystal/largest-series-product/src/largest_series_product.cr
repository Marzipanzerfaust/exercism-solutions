# Please implement your solution to largest-series-product in this file
struct Series
  def initialize(@digits : String)
  end

  def largest_product(n : Int32) : Int32 | UInt64
    raise ArgumentError.new if n > @digits.size

    return 1 if n.zero?

    return @digits
      .chars
      .map(&.to_i)
      .each_cons(n, reuse: true)
      .map(&.product(1_u64))
      .max
  end
end
