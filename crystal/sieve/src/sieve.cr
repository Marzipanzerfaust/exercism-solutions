# Please implement your solution to sieve in this file
struct Primes
  # Following the method laid out in
  # <https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Overview>;
  # optimizations not included
  def self.sieve(n : Int32) : Array(Int32)
    nums = 2..n
    primes = [] of Int32 | Nil
    primes += nums.to_a

    nums.each.with_index do |p, i|
      next if !primes[i]
      (p..n).step(p).each.with_index do |x, j|
        next if j == 0
        primes[i + j * p] = nil
      end
    end

    return primes.compact
  end
end
