# 1/22/2018: Incorporated feedback from loranger32
class Series
  def initialize(str)
    @str = str
  end

  def slices(n)
    if n > @str.length
      raise ArgumentError
    else
      @str.split('').each_cons(n).map(&:join)
    end
  end
end
