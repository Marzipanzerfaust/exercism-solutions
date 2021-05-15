module Primes
  def self.sieve(n)
    return [] of Int32 if n == 1

    primes = (2..n).to_a

    primes.each do |x|
      primes.reject! { |y| y.divisible_by?(x) && y != x }
    end

    return primes
  end
end
