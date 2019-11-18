class Poker
  require_relative "hand"
  require_relative "card"

  attr_reader :best_hand

  def initialize(arr)
    hands = arr.map { |hand| Hand.new(hand) }
    best = hands.max

    @best_hand = hands
      .select { |h| h == best }
      .map(&:to_s)
  end
end
