class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 0

    aliquot_sum = factors(n).reduce(:+)

    case aliquot_sum <=> n
    when 0 then "perfect"
    when 1 then "abundant"
    when -1 then "deficient"
    end
  end

private
  def self.factors(n)
    (1..n/2).select { |i| n % i == 0 }
  end
end
