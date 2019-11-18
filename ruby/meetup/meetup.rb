require "date"

class Meetup
  def initialize(month, year)
    @month, @year = month, year
    @first_day = Date.new(@year, @month)
    @last_day = (@first_day >> 1) - 1
  end

  def day(d, descriptor)
    (@first_day..@last_day).find do |date|
      date.method("#{d}?").call && method("#{descriptor}?").call(date.day)
    end
  end

private
  def teenth?(n)
    (13..19).include? n
  end

  def first?(n)
    (1..7).include? n
  end

  def second?(n)
    (8..14).include? n
  end

  def third?(n)
    (15..21).include? n
  end

  def fourth?(n)
    (22..28).include? n
  end

  def last?(n)
    (@last_day.day - 6 .. @last_day.day).include? n
  end
end
