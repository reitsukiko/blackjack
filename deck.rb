require_relative 'card'

class Deck
  def initialize
    @cards = []

    Card::PICTURES.each do |pic|
      val = if pic == 'A'
              11
            else
              10
            end

      Card::SUITS.each do |suit|
        @cards << Card.new(pic, suit, val)
      end
    end

    shuffle_cards
  end

  def deal_cards(num, hand)
    num.times do
      card = @cards.pop
      hand.add_card(card)
      hand.score += card.val
      hand.ace_count += 1 if card.pic == 'A'
    end
  end

  private

  def shuffle_cards
    @cards.shuffle!
  end
end
