# Please implement your solution to difference-of-squares in this file
class Squares
  def self.square_of_sum(n : Int32) : Int32
    (1..n).sum ** 2
  end

  def self.sum_of_squares(n : Int32) : Int32
    (1..n).map { |i| i ** 2 }.sum
  end

  def self.difference_of_squares(n : Int32) : Int32
    Squares.square_of_sum(n) - Squares.sum_of_squares(n)
  end
end
