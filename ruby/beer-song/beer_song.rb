module BeerSong
  def self.bottles(n)
    case n
    when 0
      "No more bottles"
    when 1
      "1 bottle"
    else
      "#{n} bottles"
    end
  end

  def self.verse(n)
    case n
    when 0
      <<~TEXT
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      TEXT
    when 1
      <<~TEXT
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
      TEXT
    else
      <<~TEXT
      #{bottles(n)} of beer on the wall, #{bottles(n)} of beer.
      Take one down and pass it around, #{bottles(n - 1)} of beer on the wall.
      TEXT
    end
  end

  def self.recite(start, n)
    start
      .downto(start - (n - 1))
      .map { |x| verse(x) }
      .join("\n")
  end
end
