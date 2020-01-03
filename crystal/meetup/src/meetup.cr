module Meetup
  def self.meetup(year : Int, month : Int, descriptor : String, day : String) : String
    last_date = Time.local(year, month, 1).at_end_of_month

    range = case descriptor
            when "teenth"
              13..19
            when "first"
              1..7
            when "second"
              8..14
            when "third"
              15..21
            when "fourth"
              22..28
            when "last"
              last_date.day - 6 .. last_date.day
            end

    raise "Invalid descriptor" if range.nil?

    dates = range.map { |d| Time.local(year, month, d) }

    output = dates.find { |d| d.day_of_week == Time::DayOfWeek.parse?(day) }

    raise Exception.new if output.nil?

    return "%04d-%02d-%02d" % {output.year, output.month, output.day}
  end
end
