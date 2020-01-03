# Brute force method with caching

module PrimeFactors
  @@primes = [2, 3]
  @@composites = [] of Int::Signed

  def self.factors(n : Int) : Array(Int::Signed)
    output = [] of Int::Signed

    return output if n == 1

    if n == 2 || n == 3
      output << n
      return output
    end

    loop do
      div = (2..n//2).find { |m| prime?(m) && n.divisible_by?(m) }

      if div
        output << div
        n //= div
      else
        output << n
        break
      end
    end

    return output
  end

  private def self.prime?(n : Int) : Bool
    # `found` will be the least known prime that is greater than or
    # equal to `n`.
    found = @@primes.bsearch do |p|
      case p <=> n
      when -1
        false
      when 1
        true
      else
        # If `p == n`, then `n` is a known prime, so we should return
        # early with `true`.
        return true
      end
    end

    # If we have gotten to this point, then `n` is not a known prime.
    if found
      # `n` is less than the greatest known prime, so it must be composite.
      return false
    else
      # `n` is greater than the greatest known prime.
      #
      # If it is in the list of known composites, it isn't prime.
      # Else, if it is divisible by any of the known primes, it isn't
      # prime.
      # Otherwise, it must be prime.

      if @@composites.bsearch(&. >= n) == n
        return false
      elsif @@primes.any? { |p| n.divisible_by?(p) }
        @@composites << n
        return false
      else
        @@primes << n
        return true
      end
    end
  end
end
