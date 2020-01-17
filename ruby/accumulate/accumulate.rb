class Array
  def accumulate
    each.with_object([]) { |i, out| out << yield(i) }
  end
end
