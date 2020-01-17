module Hamming
  def self.compute(a, b)
    raise ArgumentError if a.length != b.length

    a.size.times.count { |i| a[i] != b[i] }
  end
end
