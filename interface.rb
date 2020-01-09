# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'person'
require_relative 'dealer'
require_relative 'player'

# module Interface
module Interface
  CHOICE = [
    'Вскрыть карты',
    'Взять карту',
    'Пропустить ход'
  ].freeze

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

  def welcome
    puts "\nДобро пожаловать в игру 'blackjack_21'\n\n"
  end

  def hi_player
    puts "\nЗдраствуйте #{@player.name}\n\n"
  end

  def player_info
    puts 'Мои карты:'
    @player.show_cards
  end

  def dealer_info
    print "\nКарты дилера:"
    @dealer.show_cards
  end

  def show_me_points
    puts "Мои очки #{@player.points}\n"
  end

  def player_name
    print 'Введите совё имя:'
    @name = gets.strip.capitalize
  end

  def message_win(name = nil)
    if name.nil?
      puts "\tНичья!"
    else
      puts "\tВ раунде победил #{name}!"
    end
  end

  def messange_game(arg = nil)
    if arg.nil?
      puts 'Вы проиграли все деньги. Прощайте! '
    else
      puts 'Вы обчистили казино!'
    end
  end

  def show_player_cards
    player_info
    show_me_points
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

  def show_add_card
    puts "Я взял карту: #{@player.cards[2]}"
  end
end
