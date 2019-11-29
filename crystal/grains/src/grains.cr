class Grains
  def self.square(n : Int) : UInt64
    raise ArgumentError.new unless 0 < n <= 64

    return 2_u64 ** (n - 1)
  end

  def self.total : UInt64
    # This could be written as:
    #   1.upto(64).sum { |i| square(i) }

    # But, mathematically, we should know that the sum of the first k
    # powers of 2 (including 2^0) is 2^(k+1) - 1.  If k = 64, it is
    # 2^(65) - 1, which happens to be the maximum value for an UInt64:
    UInt64::MAX
  end
end
