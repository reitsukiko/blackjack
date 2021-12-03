require_relative 'player'

class Dealer < Player
  def initialize
    @name = 'Dealer'
    super
  end

  def score_check(deck)
    hit(deck) if @hand.score < 17
  end
end
