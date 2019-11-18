class PrimeFactors
  def self.for(n)
    least_factor = (2..n).find { |i| (n % i).zero? }

    if least_factor.nil?
      return []
    else
      return [least_factor] + self.for(n / least_factor)
    end
  end
end
