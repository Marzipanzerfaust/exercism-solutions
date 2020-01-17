module Forth
  DEFINITION = /: (?<name>\S+) (?<primitive>[^;]+) ;/

  def self.evaluate(expr : String) : Array(Int32)
    # Expressions are case-insensitive
    expr = expr.downcase

    # Dictionary of user definitions
    definitions = {} of String => String

    # Parse the expression for user definitions
    expr.scan(DEFINITION) do |m|
      # Can't redefine numbers
      raise Exception.new if m["name"].to_i?

      definitions[m["name"]] = m["primitive"]
    end

    # Once all definitions have been parsed, remove them from the
    # expression...
    expr = expr.gsub(DEFINITION, nil)

    # Then, replace all user-defined words with their corresponding
    # primitives
    definitions.each { |name, prim| expr = expr.gsub(name, prim) }

    # Now, we can evaluate the expression:
    stack = [] of Int32

    expr.split.each do |x|
      case x
      when .to_i?
        stack << x.to_i
      when "dup"
        raise Exception.new if stack.empty?

        stack << stack.last
      when "drop"
        raise Exception.new if stack.empty?

        stack.pop
      when /[+\-*\/]/, "swap", "over"
        raise Exception.new if stack.size < 2

        a, b = stack.pop(2)

        case x
        when "+"
          stack << a + b
        when "-"
          stack << a - b
        when "*"
          stack << a * b
        when "/"
          stack << a // b
        when "swap"
          stack << b << a
        when "over"
          stack << a << b << a
        end
      else
        # Unrecognized word
        raise Exception.new
      end
    end

    return stack
  end
end
