class Game
  def initialize
    @buffer = []
  end

  def roll(n)
    @buffer << n
  end

  def score
    @buffer.each_slice(2) do |frame|

    end
  end
end

class BowlingError < StandardError; end
