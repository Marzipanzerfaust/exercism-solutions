class Sieve
  attr_reader :primes

  def initialize(n)
    @primes = []

    (2..n).each do |x|
      @primes << x unless @primes.any? { |y| x % y == 0 }
    end
  end
end
