class Prime
  def self.nth(n)
    # Simple brute force method; takes a long time for big primes

    if n == 0
      raise ArgumentError
    end

    i = 0
    x = 2
    while i < n
      puts i
      if divisors(x) == [1, x]
        result = x
        i += 1
      end
      x += 1
    end

    return result
  end

  private

  def self.divisors(n)
    (1..n).select { |x| n % x == 0 }
  end
end
