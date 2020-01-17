module Squares
  def self.square_of_sum(n : Int) : Int
    (1..n).sum ** 2
  end

  def self.sum_of_squares(n : Int) : Int
    (1..n).map { |i| i ** 2 }.sum
  end

  def self.difference_of_squares(n : Int) : Int
    square_of_sum(n) - sum_of_squares(n)
  end
end
