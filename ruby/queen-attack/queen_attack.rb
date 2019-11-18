class Queens
  def initialize(white: [0, 3], black: [7, 3])
    unless white.all? { |x| x >= 0 && x <= 7 } && black.all? { |x| x >= 0 && x <= 7 }
      raise ArgumentError
    end

    @white = white
    @black = black
  end

  def attack?
    x0, y0 = @white
    x1, y1 = @black

    same_row          = x0 == x1
    same_column       = y0 == y1
    same_pos_diagonal = x0 - x1 == y0 - y1
    same_neg_diagonal = x0 + y0 == x1 + y1

    return [same_row, same_column, same_pos_diagonal, same_neg_diagonal].any?
  end
end
