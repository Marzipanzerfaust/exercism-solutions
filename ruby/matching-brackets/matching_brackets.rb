class Brackets
  PAIRS = {'(' => ')', '[' => ']', '{' => '}'}

  def self.paired?(str)
    stack = []

    str.chars.each do |char|
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
