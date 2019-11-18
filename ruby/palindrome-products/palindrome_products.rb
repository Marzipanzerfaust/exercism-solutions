class Palindromes
  attr_reader :smallest, :largest

  def initialize(min_factor: 1, max_factor: 9)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def generate
    range = (@min_factor..@max_factor).to_a

    @list = range.product(range)
      .map { |a, b| a * b }
      .uniq
      .select { |n| n.to_s == n.to_s.reverse }
      .sort
      .map { |n| Palindrome.new(n, min_factor: @min_factor, max_factor: @max_factor) }

    @smallest = @list.first
    @largest = @list.last

    return self
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(n, min_factor: 1, max_factor: 9)
    @value = n

    if @value == 9009
      puts "*************"
      puts @value
    end

    midpoint = @value/2 > max_factor ? max_factor : @value/2

    @factors = (min_factor..midpoint).each_with_object([]) do |i, array|
      cmpl = @value / i

      if @value % i == 0 && cmpl >= min_factor && cmpl <= max_factor
        if @value == 9009
          p i
          p cmpl
          gets
        end

        array << [i, cmpl]
      end
    end
  end
end
