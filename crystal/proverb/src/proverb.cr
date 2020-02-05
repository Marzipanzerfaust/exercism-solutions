module Proverb
  def self.recite(list : Array(String)) : Array(String)
    output = [] of String

    return output if list.empty?

    list.each_cons(2, reuse: true) do |(a, b)|
      output << "For want of a #{a} the #{b} was lost."
    end

    output << "And all for the want of a #{list.first}."

    return output
  end
end
