# 1/22/2018: Incorporated feedback from tenebrousedge and nic-potter

module BookKeeping
  VERSION = 2
end

class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def to(n)
    (1...n)
      .select { |x| @nums.any? { |y| (x % y).zero? } }
      .reduce(0, :+)
  end
end
