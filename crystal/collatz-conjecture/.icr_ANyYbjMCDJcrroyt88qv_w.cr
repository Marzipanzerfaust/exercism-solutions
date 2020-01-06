class CollatzConjecture
  def self.steps(n : Int) : Int
    until n == 0
      puts n
      if n.even?
        n >>= 1
      else
        n = 3 * n + 1
      end
    end

    return n
  end
end







def __icr_exec__
  CollatzConjecture.steps 12
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"