module NthPrime
  @@primes = [2]

  def self.prime(n : Int) : Int
    raise ArgumentError.new if n <= 0

    return @@primes[n - 1] if n < @@primes.size

    i = 1

    until @@primes.size + i == n
      k = @@primes.last + 1

      if @@primes.none? { |x| k.divisible_by?(x) }
        @@primes << k
      end

      i += 1
    end

    # (@@primes.last+1..).each.with_index do |k, i|
    #   if @@primes.none? { |x| k.divisible_by?(x) }
    #     @@primes << k
    #     break if @@primes.size + i + 1 == n
    #   end
    # end

    return @@primes.last
  end
end









def __icr_exec__
  # Brute force method
  NthPrime.prime(10)
  NthPrime.prime(1)
  NthPrime.prime(2)
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"