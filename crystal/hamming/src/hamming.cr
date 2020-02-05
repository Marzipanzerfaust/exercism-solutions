module Hamming
  def self.compute(a : String, b : String)
    raise ArgumentError if a.length != b.length

    a.size.times.count { |i| a[i] != b[i] }
  end
end
