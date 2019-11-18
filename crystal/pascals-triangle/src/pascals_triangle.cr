# Please implement your solution to pascals-triangle in this file
struct PascalsTriangle
  @@triangle = [[1]]

  def self.rows(i)
    return [] of Int32 if i == 0

    s = @@triangle.size

    (s..i).each do |row|
      @@triangle << [1] + @@triangle[row-1].each_cons(2).map(&.sum).to_a + [1]
    end

    return @@triangle.first(i)
  end
end
