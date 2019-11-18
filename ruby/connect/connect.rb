class Board
  attr_reader :winner

  def initialize(board)
    @board = board.map(&:split)

    @height = @board.size
    @width = @board.first.size

    @winner = if x_wins?
                "X"
              elsif o_wins?
                "O"
              else
                ""
              end
  end

  def x_wins?
    valid_left_cells = @height
      .times.map { |i| [i, 0] }
      .select { |coord| symbol(*coord) == "X" }

    valid_right_cells = @height
      .times.map { |i| [i, @width-1] }
      .select { |coord| symbol(*coord) == "X" }

    return false if valid_left_cells.empty? || valid_right_cells.empty?

    return valid_left_cells.any? do |cell|
      find_all_connected(*cell).any? do |other_cell|
        valid_right_cells.include?(other_cell)
      end
    end
  end

  def o_wins?
    valid_top_cells = @width
      .times.map { |i| [0, i] }
      .select { |cell| symbol(*cell) == "O" }

    valid_bottom_cells = @width
      .times.map { |i| [@height-1, i] }
      .select { |cell| symbol(*cell) == "O" }

    return false if valid_top_cells.empty? || valid_bottom_cells.empty?

    return valid_top_cells.any? do |cell|
      find_all_connected(*cell).any? do |other_cell|
        valid_bottom_cells.include?(other_cell)
      end
    end
  end

  def symbol(x, y)
    @board[x][y]
  end

  # Given the coordinates for a cell, returns an array of all connected
  # cells -- that is, cells that form a chain with the given cell and
  # have the same symbol.
  def find_all_connected(x, y, passed = [])
    cell = [x, y]
    sym = symbol(x, y)

    passed << cell

    adjacent_cells = adjacent(x, y)
      .select { |other| symbol(*other) == sym }
      .reject { |other| passed.include?(other) }

    adjacent_cells.each do |cell|
      passed = find_all_connected(*cell, passed)
    end

    return passed
  end

  def adjacent(x, y)
    [
      [x-1, y], [x-1, y+1],
      [x, y-1], [x, y+1],
      [x+1, y-1], [x+1, y]
    ].select { |coord| valid_coord?(*coord) }
  end

  def valid_coord?(x, y)
    x.between?(0, @height-1) && y.between?(0, @width-1)
  end
end
