class Array
  def keep
    each_with_object([]) { |i, new| new << i if yield(i) }
  end

  def discard
    each_with_object([]) { |i, new| new << i unless yield(i) }
  end
end
