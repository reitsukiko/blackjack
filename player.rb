require_relative 'bank'
require_relative 'hand'

class Player
  attr_accessor :name, :hand, :bank

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank = Bank.new
    @bank.start_sum
  end

  def hit(deck)
    deck.deal_cards(1, @hand)
    @hand.check
  end
end
