class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute

    div, mod = @minute.divmod(60)
    @hour += div
    @minute = mod

    @hour %= 24
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def to_s
    "%02i:%02i" % [@hour, @minute]
  end
end
