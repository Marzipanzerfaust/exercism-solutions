module Brackets
  PAIRS = {'(' => ')', '[' => ']', '{' => '}'}

  def self.paired?(str)
    stack = []

    str.each_char do |char|
      case char
      when '(', '[', '{'
        stack.push(char)
      when ')', ']', '}'
        unless PAIRS[stack.pop] == char
          return false
        end
      end
    end

    return stack.empty?
  end
end
