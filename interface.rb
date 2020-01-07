require_relative 'card'
require_relative 'deck'
require_relative 'person'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'

module Interface
  CHOICE = [
    'Вскрыть карты',
    'Взять карту',
    'Пропустить ход'
  ]

  def add_choice
    @choice = []
    CHOICE.each { |i| @choice << i }
  end

  def show_choice
    @choice.each_with_index do |value, index|
      puts "#{index} - #{value}"
    end
  end

  def choice
    puts "\nВыберите номер действия\n"
    show_choice
    number = gets.chomp.to_i
    choice!(number)
  end

  def choice!(number)
    if number.zero?
      @player.total_points
      @dealer.total_points if @dealer.points.zero?
      @game.analysis
      @choice.clear
    elsif number == 1
      @player.add_card(@deck.send_card)
      puts "Я взял карту: #{@player.cards[2]}"
      @dealer.analys(@deck.send_card)
      @player.total_points
      @game.analysis
      @choice.clear
    else
      @player.skip_move
      @choice.delete_at(number)
      @dealer.analys(@deck.send_card)
      choice
    end
  end

  def create
    create_cards
    create_deck
    create_player
    create_dealer
    create_game
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
    @deck.clear_deck
    @deck.add_card
  end

  def create_player
    print 'Введите совё имя:'
    name = gets.strip.capitalize
    @player = Player.new(name)
    2.times { @player.add_card(@deck.send_card) }
    puts 'Мои карты:'
    @player.show_cards
    points_analysis
  end

  def create_dealer
    @dealer = Dealer.new
    2.times { @dealer.add_card(@deck.send_card) }
    print "\nКарты дилера:"
    @dealer.show_cards
  end

  def points_analysis
    @player.total_points
    puts "Мои очки #{@player.points}\n"
    @player.restart_points
  end

  def create_game
    @game = Game.new(@player, @dealer)
    @game.add_bank
  end
end
