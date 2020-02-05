class Series
  def initialize(digits)
    @digits = digits
  end

  def largest_product(n)
    raise ArgumentError if n > @digits.size
    raise ArgumentError if @digits =~ /\D/

    return 1 if n == 0

    return @digits
      .each_char
      .map(&:to_i)
      .each_cons(n)
      .map { |group| group.reduce(:*) }
      .max
  end
end
