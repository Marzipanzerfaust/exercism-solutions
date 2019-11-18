class Board
  def self.transform(input)
    raise ArgumentError unless valid?(input)

    input.each_with_index.map do |row, i|
      row.each_char.with_index.with_object("") do |(cell, j), new|
        if cell == " "
          n = adjacent(input, i, j)
            .count { |c| c == "*" }

          new[j] = n == 0 ? " " : n.to_s
        else
          new[j] = cell
        end
      end
    end
  end

private
  def self.valid?(input)
    width = input.first.size

    return input.first == "+#{'-' * (width - 2)}+" &&
      input.last == input.first &&
      input[1...-1].all? { |row| row =~ /\A\|[\s\*]{#{width-2}}\|\z/ }
  end

  def self.adjacent(input, i, j)
    [
      input[i-1][j-1], input[i-1][j], input[i-1][j+1],
      input[i][j-1]  ,                input[i][j+1]  ,
      input[i+1][j-1], input[i+1][j], input[i+1][j+1]
    ]
  end
end
