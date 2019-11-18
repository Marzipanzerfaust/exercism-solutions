# Please implement your solution to bracket-push in this file
class Brackets
  def self.are_valid?(str : String)
    return true if str.empty?

    brackets = braces = parentheses = 0

    str.chars.each do |char|
      case char
      when '['
             brackets += 1
      when ']'
        brackets -= 1
      when '{'
             braces += 1
      when '}'
        braces -= 1
      when '('
             parentheses += 1
      when ')'
        parentheses -= 1
      end

      break if [brackets, braces, parentheses].any? { |x| x < 0 }
    end

    return [brackets, braces, parentheses].all? { |x| x == 0 }
  end
end
