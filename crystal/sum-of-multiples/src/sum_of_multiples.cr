class SumOfMultiples
  def self.sum(multiples, limit)
    limit.times.sum do |i|
      multiples.any? { |m| i.divisible_by?(m) if m > 0 } ? i : 0
    end
  end
end
