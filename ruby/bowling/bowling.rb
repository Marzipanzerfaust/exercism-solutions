class Game
  def initialize
    @buffer = []
  end

  def roll(n)
    # Rolls must be between 0 and 10
    raise BowlingError unless n.between?(0, 10)

    unless @buffer.empty?
      fs = frames
      last_frame = fs.last
      first, second = last_frame

      if fs.size == 10
        # Error-checking for the tenth frame
        case last_frame.size
        when 2
          # The second bonus roll after a strike in the tenth frame
          # cannot be a strike unless the first one is
          raise BowlingError if first == 10 && second != 10 && n == 10

          # Two bonus rolls after a strike in the tenth frame cannot
          # exceed 10 points
          raise BowlingError if first == 10 && second != 10 && n + second > 10

          # Can't roll if the frame is already full
          # (A two-throw frame is full if neither of the throws are
          # strikes or spares, meaning no fill ball can be accepted)
          raise BowlingError if first != 10 && second != 10 && first + second < 10
        when 3
          # Can't roll if the frame is already full
          raise BowlingError
        end
      else
        # Error-checking for all other frames
        case last_frame.size
        when 1
          # In non-strike frames, the second throw plus the first throw
          # cannot be greater than 10
          raise BowlingError if first != 10 && n + first > 10
        end
      end
    end

    @buffer << n
  end

  def score
    # We can't score a game that hasn't started
    raise BowlingError if @buffer.empty?

    fs = frames

    # We can't score a game that hasn't finished
    raise BowlingError if fs.size < 10

    # If the tenth frame has a strike or a spare, we can't score until
    # the fill ball has been thrown
    raise BowlingError if fs.last.sum >= 10 && fs.last.size < 3

    total = 0

    fs.each.with_index do |frame, i|
      # The tenth frame is the final frame and cannot score spares or
      # strikes, so we simply add its sum to the total and stop
      if i == 9
        total += frame.sum
        break
      end

      a, b = frame

      total += a

      if b
        total += b

        # If this frame is a spare, add the next throw to the total as a
        # bonus
        if a + b == 10
          total += fs[i + 1].first
        end
      else
        # If this frame is a strike, add the next two throws to the
        # total as a bonus
        c, d = fs[i + 1]

        total += c

        if d
          total += d
        else
          total += fs[i + 2].first
        end
      end
    end

    return total
  end

  def each_frame
    frame = []
    count = 0

    @buffer.each.with_index do |pins, i|
      if count == 9
        yield @buffer[i..]
        break
      end

      frame << pins

      if frame.sum == 10 || frame.size == 2 || i == @buffer.size - 1
        yield frame
        frame = []
        count += 1
      end
    end
  end

  def frames
    out = []
    each_frame { |f| out << f }
    return out
  end

  class BowlingError < StandardError; end
end
