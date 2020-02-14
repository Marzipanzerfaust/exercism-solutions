class CustomSet
  def initialize(array)
    @buffer = array
  end

  def size
    @buffer.size
  end

  def empty?
    @buffer.empty?
  end

  def each
    @buffer.each { |i| yield i }
  end

  def member?(item)
    @buffer.include?(item)
  end

  def subset?(other)
    @buffer.all? { |i| other.member?(i) }
  end

  def disjoint?(other)
    @buffer.none? { |i| other.member?(i) }
  end

  def ==(other)
    subset?(other) && size == other.size
  end

  def add(item)
    @buffer << item unless member?(item)
    return self
  end

  def intersection(other)
    CustomSet.new(
      @buffer.select { |i| other.member?(i) }
    )
  end

  def difference(other)
    CustomSet.new(
      @buffer.reject { |i| other.member?(i) }
    )
  end

  def union(other)
    out = CustomSet.new(@buffer)
    other.each { |i| out.add(i) }
    return out
  end
end
