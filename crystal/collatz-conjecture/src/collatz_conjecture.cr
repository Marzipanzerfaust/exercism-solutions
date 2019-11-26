class CollatzConjecture
  def self.steps(n : Int) : Int
    raise ArgumentError.new if n <= 0

    steps = 0

    until n == 1
      if n.even?
        n //= 2
      else
        n = 3 * n + 1
      end

      steps += 1
    end

    return steps
  end
end
