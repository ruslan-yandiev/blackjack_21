class Game
  attr_reader :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @bank = 0
  end
  # добавляет ставку в банк
  def add_bank
    @bank += @player.bet
    @bank += @dealer.bet
  end

  def analysis
    game_overme if @player.money <= 0 || @dealer.money <= 0

    if @player.points == @dealer.points
      refund
    elsif
    end
  end
  # метод возвращает ставки и вызывает метод обнуления банка
  def refund
    @player.add_money(10)
    @dealer.add_money(10)
    restart_bank
  end

  def restart_bank
    @bank = 0
  end

  def game_overme
    if @player.money <= 0
      puts 'Вы проиграли все деньги. Прощайте! '
      break
    elsif @dealer.money <= 0
      puts 'Вы обчистили казино!'
      break
    end
  end
end
