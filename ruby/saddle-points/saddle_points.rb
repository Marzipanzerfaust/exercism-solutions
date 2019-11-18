class Matrix
  attr_reader :rows, :columns, :saddle_points

  def initialize(str)
    @rows = str.each_line.map { |line| line.split.map(&:to_i) }

    @columns = @rows.first.size.times.with_object([]) do |i, arr|
      arr << rows.map { |row| row[i] }
    end

    @saddle_points = @rows.each_with_index.with_object([]) do |(row, i), arr|
      row.each_with_index do |elem, j|
        if elem == row.max
          if elem == @columns[j].min
            arr << [i, j]
          else
            break
          end
        end
      end
    end
  end
end
