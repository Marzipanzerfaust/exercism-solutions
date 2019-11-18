class Poker::Card
  attr_reader :rank, :suit

  def initialize(str)
    @str = str

    @rank = str[0...-1]
    @suit = str[-1]

    @rank = case @rank
            when "J" then 11
            when "Q" then 12
            when "K" then 13
            when "A" then 14
            else @rank.to_i
            end
  end

  def to_s
    @str
  end
end
