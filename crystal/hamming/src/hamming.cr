module Hamming
  def self.distance(a, b)
    raise ArgumentError.new if a.size != b.size

    a.size.times.count { |i| a[i] != b[i] }
  end
end
