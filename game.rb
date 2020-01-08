# frozen_string_literal: true

# class Game
class Game
  attr_reader :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @game_overme = false
    @bank = 0
  end

  def add_bank
    @bank += (@player.bet + @dealer.bet)
  end

  def analysis
    if @player.points == @dealer.points || @player.points > 21 && @dealer.points > 21
      puts "\tНичья!"
      refund
    elsif @player.points > @dealer.points && @player.points < 22 || @player.points < @dealer.points && @dealer.points > 21
      puts "\tВ раунде победил #{@player.name}!"
      player_victory
    elsif @dealer.points > @player.points && @dealer.points < 22 || @dealer.points < @player.points && @player.points > 21
      puts "\tВ раунде победил #{@dealer.name}!"
      dealer_victory
    end
  end

  protected

  def refund
    @player.add_money(10)
    @dealer.add_money(10)
    show_all_cards
    all_restart
    all_clear_cards
  end

  def player_victory
    @player.add_money(20)
    show_all_cards
    all_restart
    all_clear_cards
    game_overme?
  end

  def dealer_victory
    @dealer.add_money(20)
    show_all_cards
    all_restart
    all_clear_cards
    game_overme?
  end

  def show_player_cards
    puts 'Мои карты:'
    @player.show_cards!
    puts "Очки: #{@player.points}"
    puts "Баланс: #{@player.money}$\n\n"
  end

  def show_dealer_cards
    puts 'Карты дилера:'
    @dealer.show_cards!
    puts "Очки: #{@dealer.points}"
    puts "Баланс: #{@dealer.money}$\n\n"
  end

  def show_all_cards
    show_player_cards
    show_dealer_cards
  end

  def restart_points!
    @player.restart_points
    @dealer.restart_points
  end

  def restart_bank
    @bank = 0
  end

  def all_restart
    restart_bank
    restart_points!
  end

  def all_clear_cards
    @player.clear_cards
    @dealer.clear_cards
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
