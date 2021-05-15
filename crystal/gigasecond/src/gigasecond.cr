module Gigasecond
  def self.from(time : Time)
    time + 1_000_000_000.seconds
  end
end
