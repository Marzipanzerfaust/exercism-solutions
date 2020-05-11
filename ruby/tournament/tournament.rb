require "set"

class Tournament
  def self.tally(input)
    teams = Set.new

    played = Hash.new(0)
    won = Hash.new(0)
    drawn = Hash.new(0)
    lost = Hash.new(0)
    points = Hash.new(0)

    input.each_line(chomp: true) do |row|
      a, b, result = row.split(";")

      next unless a

      teams << a
      teams << b

      played[a] += 1
      played[b] += 1

      case result
      when "win"
        won[a] += 1
        lost[b] += 1
        points[a] += 3
      when "draw"
        drawn[a] += 1
        drawn[b] += 1
        points[a] += 1
        points[b] += 1
      when "loss"
        lost[a] += 1
        won[b] += 1
        points[b] += 3
      end
    end

    sorted = teams.sort do |a, b|
      if (points[b] == points[a])
        a <=> b
      else
        points[b] <=> points[a]
      end
    end

    out = "Team                           | MP |  W |  D |  L |  P\n"

    sorted.each do |team|
      out += "%-30s | %2i | %2i | %2i | %2i | %2i\n" %
        [team, played[team], won[team], drawn[team], lost[team], points[team]]
    end

    return out
  end
end
