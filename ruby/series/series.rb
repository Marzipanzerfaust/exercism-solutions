class Series
  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError if n > @str.size

    @str.chars.each_cons(n).map(&:join)
  end
end
