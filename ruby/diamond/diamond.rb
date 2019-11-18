class Diamond
  def self.make_diamond(char)
    width = (char.ord - 'A'.ord) * 2 + 1

    lines = []

    ('A'..char).each_with_index do |k, i|
      line = if i == 0
               k.center(width)
             else
               "#{k}#{' ' * (2 * i - 1)}#{k}".center(width)
             end

      lines << "#{line}\n"
    end

    lines += lines[0...-1].reverse

    return lines.join
  end
end
