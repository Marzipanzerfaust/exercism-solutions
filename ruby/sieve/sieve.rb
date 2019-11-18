class Sieve
  attr_reader :primes

  def initialize(n)
    if n == 1
      @primes = []
    else
      @primes = (2..n).to_a
      @primes.each do |x|
        @primes.reject! { |y| y % x == 0 && y != x }
      end
    end
  end
end
