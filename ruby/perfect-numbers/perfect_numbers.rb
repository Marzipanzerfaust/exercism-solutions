module PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 0

    case aliquot_sum(n) <=> n
    when 0 then "perfect"
    when 1 then "abundant"
    when -1 then "deficient"
    end
  end

  def self.aliquot_sum(n)
    (1..n/2)
      .select { |i| n % i == 0 }
      .sum
  end
end
