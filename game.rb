# frozen_string_literal: true

require_relative 'interface'

# class Game
class Game
  include Interface

  attr_reader :player, :dealer, :game_overme

  def initialize
    @game_overme = false
    @bank = 0
    start
  end

  def add_bank
    @bank += (@player.bet + @dealer.bet)
  end

  def analysis
    if @player.points == @dealer.points || @player.points > 21 && @dealer.points > 21
      refund
    elsif @player.points > 21
      dealer_victory
    elsif @dealer.points > 21 || @player.points > @dealer.points
      player_victory
    else
      dealer_victory
    end
  end

  def new_start
    add_bank
    add_choice
    create_deck
    add_cards(@player)
    add_cards(@dealer)
    player_info
    points_analysis
    dealer_info
    choice
  end

  protected

  def refund
    message_win
    @player.add_money(10)
    @dealer.add_money(10)
    show_all_cards
    all_restart
    all_clear_cards
  end

  def player_victory
    message_win(@player.name)
    @player.add_money(20)
    show_all_cards
    all_restart
    all_clear_cards
    game_overme!
  end

  def dealer_victory
    message_win(@dealer.name)
    @dealer.add_money(20)
    show_all_cards
    all_restart
    all_clear_cards
    game_overme!
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

  def choice!(number)
    if number.zero?
      @player.total_points
      @dealer.total_points if @dealer.points.zero?
      analysis
      @choice.clear
    elsif number == 1
      @player.add_card(@deck.send_card)
      show_add_card
      @dealer.analys(@deck.send_card) == 0 ? dealer_choce : dealer_choce(1)
      @player.total_points
      analysis
      @choice.clear
    else
      @player.skip_move
      @choice.delete_at(number)
      @dealer.analys(@deck.send_card) == 0 ? dealer_choce : dealer_choce(1)
      choice
    end
  end

  def create
    create_deck
    create_player
    create_dealer
    add_bank
  end

  def start
    welcome
    create
    add_choice
    choice
  end

  def create_deck
    @deck = Deck.new
  end

  def create_player
    begin
      player_name
      @player = Player.new(@name)
    rescue RuntimeError => e
      puts e
      retry
    end
    hi_player
    add_cards(@player)
    player_info
    points_analysis
  end

  def create_dealer
    @dealer = Dealer.new
    add_cards(@dealer)
    dealer_info
  end

  def points_analysis
    @player.total_points
    show_me_points
    @player.restart_points
  end

  def add_cards(user)
    2.times { user.add_card(@deck.send_card) }
  end

  def game_overme!
    if @player.money <= 0
      messange_game
      @game_overme = true
    elsif @dealer.money <= 0
      messange_game(1)
      @game_overme = true
    end
  end
end
