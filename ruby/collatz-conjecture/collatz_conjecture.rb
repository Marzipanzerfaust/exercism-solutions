module CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n <= 0

    i = 0

    until n == 1
      if n.even?
        n /= 2
      else
        n = 3 * n + 1
      end

      i += 1
    end

    return i
  end
end
