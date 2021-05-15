module MatchingBrackets
  # Maps each closer with its corresponding opener
  MAP = { ']' => '[', '}' => '{', ')' => '(' }

  def self.valid?(str)
    stack = [] of Char

    str.each_char do |char|
      case char
      when '[', '{', '('
        stack << char
      when ']', '}', ')'
        return false if stack.empty?
        return false if stack.pop != MAP[char]
      end
    end

    return stack.empty?
  end
end
