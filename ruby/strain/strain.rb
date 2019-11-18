class Array
  def keep
    self.each_with_object([]) { |i, new| new << i if yield(i) }
  end

  def discard
    self.each_with_object([]) { |i, new| new << i unless yield(i) }
  end
end
