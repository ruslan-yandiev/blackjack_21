require_relative 'card'
require_relative 'deck'
require_relative 'person'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'

class Interface
  attr_reader :deck, :player, :dealer, :game

  CHOICE = [
    'Пропустить ход',
    'Взять карту',
    'Вскрыть карты'
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
    show_choice
    puts 'Выберите номер действия'
    number = gets.chomp.to_i
    CHOICE[number]
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
  end

  def create_dealer
    @dealer = Dealer.new
  end

  def create_game
    @game = Game.new(@player, @dealer)
  end
end

interface = Interface.new
interface.show_choice
interface::CHOICE['Вскрыть карты']
