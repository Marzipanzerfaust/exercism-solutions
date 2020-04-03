module Diamond
  def self.make_diamond(char)
    width = (char.ord - 'A'.ord) * 2 + 1
    height = char.ord - 'A'.ord + 1

    triangle = Array.new(height)

    ('A'..char).each_with_index do |k, i|
      line = if i == 0
               k.center(width)
             else
               "#{k}#{' ' * (2 * i - 1)}#{k}".center(width)
             end

      triangle[i] = "#{line}\n"
    end

    return (triangle + triangle[...-1].reverse).join
  end
end
