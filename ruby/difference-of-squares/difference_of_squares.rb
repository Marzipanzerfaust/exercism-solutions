class Squares
  attr_reader :square_of_sum, :sum_of_squares, :difference

  def initialize(n)
    @square_of_sum = (1..n).reduce(:+) ** 2
    @sum_of_squares = (1..n).map { |x| x ** 2 }.reduce(:+)
    @difference = @square_of_sum - @sum_of_squares
  end
end
