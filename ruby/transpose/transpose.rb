module Transpose
  def self.transpose(input)
    return "" if input.empty?

    lines = input.lines(chomp: true)

    # Pad each line with spaces until they are as long as the longest
    # line
    largest_size = lines.map(&:size).max

    lines.fill do |i|
      lines[i].ljust(largest_size, " ")
    end

    # Transpose
    out = lines.map(&:chars).transpose.map(&:join)

    # Now that the lines have been transposed, we need to ensure that
    # each new line is the correct width by trimming unnecessary
    # whitespace
    curr_width = 0

    out.size.times.reverse_each do |i|
      tmp = out[i].rstrip

      curr_width = tmp.size if tmp.size > curr_width

      out[i] = tmp.ljust(curr_width, " ")
    end

    return out.join("\n")
  end
end
