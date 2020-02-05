require "set"

Palindrome = Struct.new(:value, :factors)

class Palindromes
  def self.palindrome?(n)
    str = n.to_s
    return str == str.reverse
  end

  def initialize(min_factor: 1, max_factor: 9)
    @min_factor = min_factor
    @max_factor = max_factor

    @values_to_factors = Hash.new { |h, k| h[k] = Set.new }
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2) do |i, j|
      value = i * j

      if Palindromes.palindrome?(value)
        @values_to_factors[value] << [i, j].sort
      end
    end
  end

  def get(n)
    Palindrome.new(n, @values_to_factors[n].to_a)
  end

  def largest
    get(@values_to_factors.keys.max)
  end

  def smallest
    get(@values_to_factors.keys.min)
  end
end
