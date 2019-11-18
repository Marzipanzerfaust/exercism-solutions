class TwelveDays
  def self.song
    days = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

    gifts = [
      'a Partridge in a Pear Tree',
      'two Turtle Doves',
      'three French Hens',
      'four Calling Birds',
      'five Gold Rings',
      'six Geese-a-Laying',
      'seven Swans-a-Swimming',
      'eight Maids-a-Milking',
      'nine Ladies Dancing',
      'ten Lords-a-Leaping',
      'eleven Pipers Piping',
      'twelve Drummers Drumming'
    ]

    output = []

    12.times do |i|
      str = "On the #{days[i]} day of Christmas my true love gave to me: "

      if i == 0
        str << gifts.first
      else
        str << "#{gifts[1..i].reverse.join(', ')}, and #{gifts.first}"
      end

      str << ".\n"

      output << str
    end

    return output.join("\n")
  end
end
