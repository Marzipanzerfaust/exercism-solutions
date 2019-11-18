class Poker::Hand
  include Comparable

  # Base hand scores
  ROYAL_FLUSH = 9
  STRAIGHT_FLUSH = 8
  FOUR_OF_A_KIND = 7
  FULL_HOUSE = 6
  FLUSH = 5
  STRAIGHT = 4
  THREE_OF_A_KIND = 3
  TWO_PAIR = 2
  ONE_PAIR = 1
  HIGH_CARD = 0

  attr_reader :ranks, :score

  def initialize(hand)
    @cards = hand.map { |str| Poker::Card.new(str) }

    @ranks = @cards.map(&:rank).sort
    @rank_chunks = @ranks.chunk_while { |a, b| a == b }.to_a
    @rank_sizes = @rank_chunks.map(&:size)

    # We have to account for a special case where aces can be low
    # for the purpose of making a straight
    if @ranks == [2, 3, 4, 5, 14]  # 14 is the numeric rank for aces
      # Replace the 14 with a 1 to indicate that the ace is low
      @ranks.pop
      @ranks.unshift(1)
    end

    @score = if royal_flush? then ROYAL_FLUSH
             elsif straight_flush? then STRAIGHT_FLUSH
             elsif four_of_a_kind? then FOUR_OF_A_KIND
             elsif full_house? then FULL_HOUSE
             elsif flush? then FLUSH
             elsif straight? then STRAIGHT
             elsif three_of_a_kind? then THREE_OF_A_KIND
             elsif two_pair? then TWO_PAIR
             elsif one_pair? then ONE_PAIR
             else HIGH_CARD
             end
  end

  def royal_flush?
    straight_flush? && @ranks.first == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    @rank_sizes.include? 4
  end

  def full_house?
    @rank_sizes.sort == [2, 3]
  end

  def flush?
    @cards.each_cons(2).all? { |a, b| a.suit == b.suit }
  end

  def straight?
    @ranks.each_cons(2).all? { |a, b| a + 1 == b }
  end

  def three_of_a_kind?
    @rank_sizes.include? 3
  end

  def two_pair?
    @rank_sizes.sort == [1, 2, 2]
  end

  def one_pair?
    @rank_sizes.include? 2
  end

  def <=>(other)
    return @score <=> other.score if @score != other.score

    # If the scores of each hand are the same, we have to go through a
    # complex routine to determine a tiebreaker value
    case @score
    when ROYAL_FLUSH
      # All royal flushes have the same value
      0
    when FOUR_OF_A_KIND
      # The value of a four of a kind is the value of the hand's
      # four-sized chunk
      find_chunk_value(4) <=> other.find_chunk_value(4)
    when FULL_HOUSE, THREE_OF_A_KIND
      find_chunk_value(3) <=> other.find_chunk_value(3)
    when TWO_PAIR
      # The value of a two pair is the value of the highest pair
      find_chunk_values(2).max <=> other.find_chunk_values(2).max
    when ONE_PAIR
      find_chunk_value(2) <=> other.find_chunk_value(2)
    else
      # For all other hands, we need to compare each rank in each
      # hand side-by-side, from highest to lowest
      @ranks.reverse.zip(other.ranks.reverse) do |a, b|
        return a <=> b unless a == b
      end

      return 0
    end
  end

  def find_chunk_value(n)
    @rank_chunks.find { |c| c.size == n }
  end

  def find_chunk_values(n)
    @rank_chunks.find_all { |c| c.size == n }
  end

  def to_s
    @cards.map(&:to_s)
  end
end
