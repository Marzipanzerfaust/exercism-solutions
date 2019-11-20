class CustomSet
  attr_reader :array

  def initialize(arr)
    @array = arr
  end

  def empty?
    @array.empty?
  end

  def member?(item)
    @array.include?(item)
  end

  def subset?(other)
    @array.all? { |i| other.member?(i) }
  end

  def disjoint?(other)
    @array.none? { |i| other.member?(i) }
  end

  def ==(other)
    self.subset?(other) && other.subset?(self)
  end

  def add(item)
    @array << item unless member?(item)
    return self
  end

  def intersection(other)
    CustomSet.new(
      @array.select { |i| other.member?(i) }
    )
  end

  def difference(other)
    CustomSet.new(
      @array.reject { |i| other.member?(i) }
    )
  end

  def union(other)
    out = CustomSet.new(@array)
    other.array.each { |i| out.add(i) }
    return out
  end
end
