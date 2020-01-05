class Game
  attr_reader :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
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
      open_cards
      @player.add_money(20)
      restart_bank
      game_overme?
    elsif @dealer.points > @player.points && @dealer.points < 22
      open_cards
      @dealer.add_money(20)
      restart_bank
      game_overme?
    end
  end
  # метод возвращает ставки и вызывает метод обнуления банка
  def refund
    puts 'Ничья'
    @player.add_money(10)
    @dealer.add_money(10)
    restart_bank
  end

  def open_cards
    @player.show_cards!
    @dealer.show_cards!
  end

  def restart_bank
    @bank = 0
  end

  def game_overme?
    if @player.money <= 0
      puts 'Вы проиграли все деньги. Прощайте! '
      true
    elsif @dealer.money <= 0
      puts 'Вы обчистили казино!'
      true
    end
  end
end
