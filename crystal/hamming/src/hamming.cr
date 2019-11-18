# Please implement your solution to hamming in this file
class Hamming
  def self.compute(strand1 : String, strand2 : String)
    if strand1 == strand2
      0
    elsif strand1.size != strand2.size
      raise ArgumentError.new
    else
      strand1.chars.each_with_index.count { |x, i| x != strand2[i] }
    end
  end
end
