class Grains
  def self.square(n)
    if n < 1 || n > 64
      raise ArgumentError
    end

    return 2 ** (n-1)
  end

  def self.total
    (0..(64-1)).map { |x| 2 ** x }.reduce(:+)
  end
end
