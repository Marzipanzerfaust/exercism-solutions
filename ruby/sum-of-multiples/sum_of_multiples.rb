class SumOfMultiples
  def initialize(*ns)
    @ns = ns
  end

  def to(n)
    (1...n)
      .select { |i| @ns.any? { |j| i % j == 0 } }
      .sum
  end
end
