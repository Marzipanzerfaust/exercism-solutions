# NOTE: These are basically Enumerable#select and Enumerable#reject

class Array(T)
  def keep
    out = [] of T
    each { |i| out << i if yield i }
    out
  end

  def discard
    out = [] of T
    each { |i| out << i unless yield i }
    out
  end
end
