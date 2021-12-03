class Interface
  def introduce_gamer
    puts 'Добро пожаловать в игру! Введите имя: '
  end

  def choose_option
    puts 'Введите 1, чтобы взять карту'
    puts 'Введите 0, чтобы пропустить'
  end

  def choose_option_to_continue
    puts 'Введите 1, чтобы продолжить'
    puts 'Введите 0, чтобы остановить'
  end

  def show_hand(player)
    print "#{player.name}: "
    player.hand.cards.each { |card| puts card.face }
  end

  def show_hidden_hand(player)
    print "#{player.name}: "
    player.hand.cards.each { |_card| puts '---' }
  end

  def show_score(player)
    puts "Счёт: #{player.hand.score}"
  end

  def show_total_bet(total_bet)
    puts "Общая ставка: #{total_bet}"
  end

  def show_bank(player)
    puts "Банк #{player.name}: #{player.bank.money}"
  end

  def show_winner(name)
    if name
      puts "Победитель: #{name}"
    else
      puts 'Ничья'
    end
  end
end
