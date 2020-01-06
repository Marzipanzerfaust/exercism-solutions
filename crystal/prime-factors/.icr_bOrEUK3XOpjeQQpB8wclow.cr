def prime?(n)
    if n == 2 || n == 3
      true
    else
      (2..n//2).none? { |m| prime?(m) && n.divisible_by?(m) }
    end
  end






def __icr_exec__
  prime?(2)
  prime?(4)
  prime?(5)
  prime?(6)
  prime?(7)
  prime?(12)
  prime?(11)
  prime?(111)
  prime?(15485863)
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"