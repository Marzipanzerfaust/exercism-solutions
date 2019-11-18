class BinarySearch
  attr_reader :list, :middle

  def initialize(arr)
    arr.each_cons(2) do |a, b|
      raise ArgumentError if a > b
    end

    @list = arr
    @middle = @list.size / 2
  end

  def search_for(n)
    raise RuntimeError if @list.size == 1 && @list.first != n

    case @list[@middle] <=> n
    when -1
      @middle + BinarySearch.new(@list[@middle+1..-1]).search_for(n) + 1
    when 0
      @middle
    when 1
      BinarySearch.new(@list[0...@middle]).search_for(n)
    end
  end
end
