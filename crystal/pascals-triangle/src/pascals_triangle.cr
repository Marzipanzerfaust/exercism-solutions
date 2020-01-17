module PascalsTriangle
  @@triangle = [[1]]

  def self.rows(n : Int)
    raise ArgumentError.new if n < 0

    return [] of Int32 if n == 0

    @@triangle.size.upto(n) do |i|
      row = [] of Int32

      row << 1
      @@triangle[i - 1].each_cons(2) { |(a, b)| row << a + b }
      row << 1

      @@triangle << row
    end

    return @@triangle[...n]
  end
end
