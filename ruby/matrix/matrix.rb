class Matrix
  attr_reader :rows, :columns

  def self.rotate(array)
    # Rotate 90 degrees

    width = array.first.size
    new = []

    width.times do |i|
      new << array.map { |row| row[i] }
    end

    return new
  end

  def initialize(str)
    @rows = str.split("\n").map { |row| row.split.map(&:to_i) }
    @columns = Matrix.rotate(@rows)
  end
end
