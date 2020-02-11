class Matrix
  attr_reader :rows, :columns, :saddle_points

  def initialize(str)
    @rows = str.each_line.map { |line| line.split.map(&:to_i) }

    @columns = @rows.transpose

    @saddle_points = @rows.each_with_index.with_object([]) do |(row, i), arr|
      row_max = row.max

      row.each_with_index do |elem, j|
        if elem == row_max
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
