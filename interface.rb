require_relative 'card'
require_relative 'deck'
require_relative 'person'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'

class Interface
  attr_reader :deck, :player, :dealer, :game

  CHOICE = [
    'Вскрыть карты',
    'Взять карту',
    'Пропустить ход'
  ]

  def initialize
    create_cards
    create_deck
    create_player
    create_dealer
    create_game
  end

  def show_choice
    CHOICE.each_with_index do |value, index|
      puts "#{index} - #{value}"
    end
  end

  def choice
    puts 'Выберите номер действия'
    show_choice
    number = gets.chomp.to_i
    choice!(number)
  end

  def choice!(number)
    if number.zero?
      @game.analysis
    elsif number == 1
      @player.add_card(@deck.send_card)
      player_points
      @dealer.analysis(@deck.send_card)
      @game.analysis
    else
      @player.skip_move
      CHOICE.delete_at(number)
      @dealer.analysis(@deck.send_card)
      choice
    end
  end

  def create_cards
    Card::SUITS.each do |suit|
      Card::NAMES.each_with_index do |name, index|
       Deck.add_card(Card.new(suit + name => Card::VALUES[index]))
      end
    end
  end

  def create_deck
    @deck = Deck.new
    @deck.add_card
  end

  def create_player
    print 'Введите совё имя:'
    name = gets.strip.capitalize
    @player = Player.new(name)
    2.times { @player.add_card(@deck.send_card) }
    player_points
  end

  def player_points
    puts @player.show_cards
    @player.total_points
    puts "Количество очков: #{@player.points}"
  end

  def create_dealer
    @dealer = Dealer.new
    2.times { @dealer.add_card(@deck.send_card) }
    puts @dealer.show_cards
    @dealer.total_points
  end

  def create_game
    @game = Game.new(@player, @dealer)
    @game.add_bank
  end
end
