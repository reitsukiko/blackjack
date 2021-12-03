class Bank
  attr_accessor :sum

  START_SUM = 100
  BET = 10

  def initialize
    @sum = 0
  end

  def start_sum
    @sum = START_SUM

  def bet
    @sum -= BET
  end

  def return_bet
    @sum += BET
  end

  def win
    @sum += win_bet
  end

  def win_bet
    BET * 2
  end
end
