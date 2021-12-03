require_relative 'player'
require_relative 'dealer'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'
require_relative 'interface'

class Game
  attr_accessor :deck, :player, :dealer, :total_bet

  def initialize
    @interface = Interface.new

    start
  end

  def start
    @interface.introduce_gamer
    name = gets.chomp

    @player = Player.new(name)
    @dealer = Dealer.new

    round
  end

  def round
    while @dealer.bank.sum.positive? && @player.bank.sumpositive?
      start_round

      @interface.show_hidden_hand(@dealer)
      @interface.show_hand(@player)
      @interface.show_score(@player)

      @interface.choose_option
      point = gets.chomp.to_i
      @player.hit(@deck) if point == 1

      @dealer.score_check(@deck)

      @interface.show_total_bet(@total_bet)
      @interface.show_hand(@dealer)
      @interface.show_score(@dealer)
      @interface.show_hand(@player)
      @interface.show_score(@player)
      @interface.show_winner(end_round)
      @interface.show_bank(@dealer)
      @interface.show_bank(@player)

      @interface.choose_option_to_continue
      point = gets.chomp.to_i
      if point == 1
        next
      else
        break
      end
    end
  end

  def start_round
    @deck = Deck.new
    @bank = Bank.new

    @total_bet = 0

    @dealer.hand.free_hand
    @player.hand.free_hand

    @dealer.hand.reset_score
    @player.hand.reset_score

    @dealer.bank.bet
    @player.bank.bet

    @total_bet = @bank.win_bet

    @deck.deal_cards(2, @dealer.hand)
    @deck.deal_cards(2, @player.hand)

    @dealer.hand.check
    @player.hand.check
  end

  def end_round
    dealer_score = @dealer.hand.score
    player_score = @player.hand.score

    if dealer_score <= 21 && player_score <= 21
      if dealer_score > player_score
        give_win_bet(@dealer)
        @dealer.name
      elsif dealer_score < player_score
        give_win_bet(@player)
        @player.name
      elsif dealer_score == player_score
        @player.bank.return_bet
        @dealer.bank.return_bet
        false
      end
    elsif dealer_score <= 21 && player_score > 21
      give_win_bet(@dealer)
      @dealer.name
    elsif dealer_score > 21 && player_score <= 21
      give_win_bet(@player)
      @player.name
    elsif dealer_score > 21 && player_score > 21
      @player.bank.return_bet
      @dealer.bank.return_bet
      false
    end
  end

  def give_win_bet(player)
    player.bank.win
  end
end

game = Game.new
