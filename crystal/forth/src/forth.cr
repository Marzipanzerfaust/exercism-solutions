module Forth
  def self.evaluate(expr)
    expr = expr.downcase

    definitions = {} of String => String

    expr = expr.gsub(/: (\S+) (.+?) ;/) do
      raise Exception.new if $1.to_i?
      definitions[$1] = $2
      next
    end

    expr = expr.gsub(/\S+/) do
      definitions.fetch($0, $0)
    end

    stack = Deque(Int16).new

    expr.split do |token|
      case token
      when .to_i?
        stack << token.to_i16
      when "+"
        a, b = stack.pop, stack.pop
        stack << b + a
      when "-"
        a, b = stack.pop, stack.pop
        stack << b - a
      when "*"
        a, b = stack.pop, stack.pop
        stack << b * a
      when "/"
        a, b = stack.pop, stack.pop
        stack << b // a
      when "dup"
        stack << stack.last
      when "drop"
        stack.pop
      when "swap"
        stack.swap(-1, -2)
      when "over"
        stack << stack[-2]
      else
        raise Exception.new
      end
    end

    return stack.to_a
  end
end
