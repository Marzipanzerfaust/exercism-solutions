module BookKeeping
  VERSION = 3
end

class BeerSong
  def initialize
    @verses = (0..99).map do |n|
      case n
      when 0
        <<~EOF
          No more bottles of beer on the wall, no more bottles of beer.
          Go to the store and buy some more, 99 bottles of beer on the wall.
        EOF
      when 1
        <<~EOF
          1 bottle of beer on the wall, 1 bottle of beer.
          Take it down and pass it around, no more bottles of beer on the wall.
        EOF
      else
        <<~EOF
          #{(current = pluralize(n, 'bottle', 'bottles').capitalize)} of beer on the wall, #{current} of beer.
          Take one down and pass it around, #{pluralize(n-1, 'bottle', 'bottles')} of beer on the wall.
        EOF
      end
    end
  end

  def verse(n)
    @verses[n]
  end

  def verses(start, finish)
    @verses[finish..start].reverse.join("\n")
  end

  private

  def pluralize(n, singular, plural)
    case n
    when 1
      "1 #{singular}"
    when 0
      "no more #{plural}"
    else
      "#{n} #{plural}"
    end
  end
end
