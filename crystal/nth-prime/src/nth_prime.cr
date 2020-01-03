# Brute force method with caching

module NthPrime
  @@primes = [2]

  def self.prime(n : Int) : Int
    raise ArgumentError.new if n <= 0

    return @@primes[n - 1] if n <= @@primes.size

    (@@primes.last+1..).each.with_index do |k, i|
      if @@primes.none? { |x| k.divisible_by?(x) }
        @@primes << k
        break if @@primes.size == n
      end
    end

    return @@primes.last
  end
end
