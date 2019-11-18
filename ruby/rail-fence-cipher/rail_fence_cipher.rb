class RailFenceCipher
  def self.encode(str, n)
    1.upto(n).with_object("") do |i, output|
      p = periods(i, n)

      idx = i - 1
      while (char = str[idx])
        output << char
        idx += p.next
      end
    end
  end

  def self.decode(str, n)
  end

private
  # Through induction, it can be seen that the nth rail of m total rails
  # -- where m > 1 -- has a cycling period of [2(m-n), 2(n-1)], unless
  # it is the first or last rail, in which case it has a period of
  # 2(m-1).  If m = 1, then the period is always 1.
  def self.periods(n, m)
    if m == 1
      a = b = 1
    elsif n == 1 || n == m
      a = b = 2 * (m-1)
    else
      a, b = [2*(m-n), 2*(n-1)]
    end

    return [a, b].cycle
  end
end
