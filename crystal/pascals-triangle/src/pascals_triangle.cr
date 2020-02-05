module PascalsTriangle
  @@triangle = [[1]]

  def self.rows(n : Int)
    raise ArgumentError.new if n < 0

    return [] of Int32 if n == 0

    @@triangle.size.upto(n) do |i|
      row = Array(Int32).new(i + 1)

      row << 1

      @@triangle[i - 1].each_cons(2, reuse: true) do |(a, b)|
        row << a + b
      end

      row << 1

      @@triangle << row
    end

    return @@triangle[...n]
  end
end
