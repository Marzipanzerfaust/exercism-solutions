module PrimeFactors
  def self.of(n, factors = [])
    least_factor = (2..n).find { |i| n % i == 0 }

    if least_factor
      factors << least_factor
      return of(n / least_factor, factors)
    else
      return factors
    end
  end
end
