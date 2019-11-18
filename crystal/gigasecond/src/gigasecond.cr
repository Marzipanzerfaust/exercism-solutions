# Please implement your solution to gigasecond in this file
class Gigasecond
  def self.from(time : Time)
    time + 1_000_000_000.seconds
  end
end
