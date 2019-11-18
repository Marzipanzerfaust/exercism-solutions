class Triplet
  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a < @b && @b < @c &&
      @a ** 2 + @b ** 2 == @c ** 2
  end

  def self.where(sum: nil, min_factor: 1, max_factor: 100)
    triplets = (min_factor..max_factor)
      .to_a
      .combination(3)
      .map { |a, b, c| Triplet.new(a, b, c) }
      .select(&:pythagorean?)

    triplets.select! { |t| t.sum == sum } if sum

    return triplets
  end
end
