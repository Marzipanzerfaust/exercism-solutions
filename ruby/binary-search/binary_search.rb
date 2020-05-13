class BinarySearch
  attr_reader :list, :middle

  def initialize(array)
    array.each_cons(2) do |a, b|
      raise ArgumentError if a > b
    end

    @list = array
    @middle = @list.size / 2
  end

  def search_for(n)
    if @list.size == 1
      if @list.first == n
        return 0
      else
        raise RuntimeError
      end
    end

    case @list[@middle] <=> n
    when -1
      BinarySearch.new(@list[@middle..]).search_for(n) + @middle
    when 0
      @middle
    when 1
      BinarySearch.new(@list[...@middle]).search_for(n)
    end
  end
end
