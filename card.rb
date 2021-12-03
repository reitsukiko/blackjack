class Card
  attr_accessor :pic, :suit, :val

  PICTURES = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['♠', '♥', '♣', '♦'].freeze

  def initialize(pic, suit, val)
    @pic = pic
    @suit = suit
    @val = val
  end

  def face
    "#{pic} #{suit}"
  end
end
