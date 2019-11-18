class Series
  def initialize(digits)
    @digits = digits
  end

  def largest_product(n)
    raise ArgumentError if n > @digits.size
    raise ArgumentError if @digits.chars.any? { |d| d !~ /\d/ }

    return 1 if n == 0

    return @digits
      .each_char
      .each_cons(n)
      .map { |group| group.map(&:to_i).reduce(:*) }
      .max
  end
end
