class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = [ [1] ]

    (1...n).each do |i|
      prev = @rows[i-1]

      curr = [1]
      prev.each_cons(2) { |a, b| curr << a + b }
      curr << 1

      @rows << curr
    end
  end
end
