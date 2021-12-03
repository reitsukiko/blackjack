class Hand
  attr_accessor :cards, :score, :ace_count

  def initialize
    @cards = []
    @score = 0
    @ace_count = 0
  end

  def add_card(card)
    @cards << card
  end

  def check
    recalculation while @score > 21 && @ace_count.positive?
  end

  def recalculation
    @score -= 10
    @ace_count -= 1
  end

  def free_hand
    @cards = []
  end

  def reset_score
    @score = 0
  end
end
