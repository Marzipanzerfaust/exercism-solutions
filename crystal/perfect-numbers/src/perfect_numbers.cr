class PerfectNumbers
  def self.classify(n : Int) : String
    raise ArgumentError.new if n <= 0

    case aliquot_sum(n) <=> n
    when -1
      "deficient"
    when 1
      "abundant"
    else
      "perfect"
    end
  end

  private def self.aliquot_sum(n : Int) : Int
    (1..n/2)
      .to_a.select { |x| n.divisible_by? x }
      .sum
  end
end
