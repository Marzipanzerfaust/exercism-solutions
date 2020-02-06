module Hamming
  def self.compute(a : String, b : String) : Int
    raise ArgumentError.new if a.size != b.size

    a.size.times.count { |i| a[i] != b[i] }
  end
end
