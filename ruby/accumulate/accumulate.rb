module BookKeeping
  VERSION = 1
end

class Array
  def accumulate
    self.each_with_object([]) { |i, new| new << yield(i) }
  end
end
