module Prime
  @@primes = [2, 3]

  def self.nth(n)
    raise ArgumentError if n <= 0

    return @@primes[n - 1] if n <= @@primes.size

    (@@primes.last+2..).step(2).each do |p|
      if @@primes.none? { |x| p % x == 0 }
        @@primes << p
        break if @@primes.size == n
      end
    end

    return @@primes.last
  end
end
