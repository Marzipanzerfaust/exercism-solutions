class OcrNumbers
  ZERO =  [" _ ",
           "| |",
           "|_|",
           "   "].join("\n")
  ONE =   ["   ",
           "  |",
           "  |",
           "   "].join("\n")
  TWO =   [" _ ",
           " _|",
           "|_ ",
           "   "].join("\n")
  THREE = [" _ ",
           " _|",
           " _|",
           "   "].join("\n")
  FOUR =  ["   ",
           "|_|",
           "  |",
           "   "].join("\n")
  FIVE =  [" _ ",
           "|_ ",
           " _|",
           "   "].join("\n")
  SIX =   [" _ ",
           "|_ ",
           "|_|",
           "   "].join("\n")
  SEVEN = [" _ ",
           "  |",
           "  |",
           "   "].join("\n")
  EIGHT = [" _ ",
           "|_|",
           "|_|",
           "   "].join("\n")
  NINE =  [" _ ",
           "|_|",
           " _|",
           "   "].join("\n")

  DIGIT_WIDTH = 3
  DIGIT_HEIGHT = 4

  def self.convert(input)
    array = input.split("\n")

    row_size = array.first.size
    col_size = array.size

    if row_size % DIGIT_WIDTH != 0 || col_size % DIGIT_HEIGHT != 0
      raise ArgumentError
    end

    no_rows = row_size / DIGIT_WIDTH
    no_cols = col_size / DIGIT_HEIGHT

    digits =
  end

private
  # Returns a "slice" out of a two-dimensional array.
  # Example:
  # x = [ %w(foo bar baz), %w(a b c) ]
  # slice_2d(x
  def slice_2d(array_2d)

  end
end
