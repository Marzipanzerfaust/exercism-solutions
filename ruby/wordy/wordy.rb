require "strscan"

class WordProblem
  def initialize(str)
    s = StringScanner.new(str)

    until s.check(/-?\d/)
      s.pos += 1
      return if s.eos?
    end

    @answer = s.scan(/-?\d+/).to_i

    until s.check(/\?/)
      if s.scan(/ [a-z\s]+ /)
        op = case s.matched
             when /plus/ then :+
             when /minus/ then :-
             when /multiplied by/ then :*
             when /divided by/ then :/
             end
        rhs = s.scan(/-?\d+/).to_i
      elsif s.scan(/ raised to the (\d+)\w+ power /)
        op = :**
        rhs = $1.to_i
      else
        @answer = nil
        return
      end

      @answer = @answer.method(op).call(rhs)
    end
  end

  def answer
    raise ArgumentError if @answer.nil?
    return @answer
  end
end
