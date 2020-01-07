class Game
  attr_reader :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @game_overme
    @bank = 0
  end
  # добавляет ставку в банк
  def add_bank
    @bank += (@player.bet + @dealer.bet)
  end
  # метод анализирует количество очков у игроков и определяет победителя
  def analysis
    if @player.points == @dealer.points || @player.points > 21 && @dealer.points > 21
      open_cards
      refund
    elsif @player.points > @dealer.points && @player.points < 22
      puts "\tВ раунде победил #{@player.name}"
      open_cards
      @player.add_money(20)
      restart_bank
      restart_points!
      @player.clear_cards
      @dealer.clear_cards
      game_overme?
    elsif @dealer.points > @player.points && @dealer.points < 22
      puts "\tВ раунде победил #{@dealer.name}"
      open_cards
      @dealer.add_money(20)
      restart_bank
      restart_points!
      @dealer.clear_cards
      @player.clear_cards
      game_overme?
    end
  end
  # метод возвращает ставки и вызывает метод обнуления банка
  def refund
    puts 'Ничья'
    @player.add_money(10)
    @player.clear_cards
    @dealer.add_money(10)
    @dealer.clear_cards
    restart_bank
    restart_points!
  end

  def open_cards
    puts 'Ваши карты:'
    @player.show_cards!
    puts "Очки: #{@player.points}"
    puts
    puts 'Карты дилера:'
    @dealer.show_cards!
    puts "Очки: #{@dealer.points}"
    puts
  end

  def restart_points!
    @player.restart_points
    @dealer.restart_points
  end

  def restart_bank
    @bank = 0
  end

  def game_overme?
    if @player.money <= 0
      puts 'Вы проиграли все деньги. Прощайте! '
      @game_overme = true
    elsif @dealer.money <= 0
      puts 'Вы обчистили казино!'
      @game_overme = true
    end
  end
end
