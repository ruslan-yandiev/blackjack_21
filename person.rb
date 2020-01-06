class Person
  attr_reader :cards, :name, :money, :points

  def initialize(name = nil)
    @name = name || 'dealer'
    @cards = []
    @money = 100
    @points = 0
  end
  # метод добавляет по одному объекту класса Card в массив
  def add_card(card)
    @cards << card
  end
  # покажет объекты если имеется любое имя ирока кроме имени dealer, иначе вернёт * в количестве имеющихся карт
  def show_cards
    @name == 'dealer' ? show_others : show_cards!
  end

  def show_cards!
    @cards.each { |card| puts card }
  end

  def show_others
    print "* *"
  end
  # метод делает ставку
  def bet
    change_money
    10
  end
  # метод вычитает поставленные деньги
  def change_money
    @money -= 10
  end

  def add_money(money)
    @money += money
  end

  def skip_move
    "#{@name} пропускает ход"
  end
  # метод складывает очки за карты путем вызова высокозависимого метода
  def total_points
    sort_cards
    @cards.each { |card| point_plus(card) }
  end

  def clear_cards
    @cards.clear
  end

  protected

  # изолированный метод, так-как высокая зависимость от инстанс методов класса Card
  def point_plus(card)
    if card.show_name.include?("A") # => Подумать как отрефакторить код
      if @points > 10 && @points != 21
        @points += 1
      elsif @points == 21
        @points -= 9
      else
        @points += 11
      end
      # @points > 10 ? @points += 1 : @points += 11
    else
      @points += card.show_value
    end
  end
  # метод сортирует массив с картами так, чтобы последними были всегда тузы, для гибкого подсчета очков
  # метод высокозависимый от инстанс метода класса Card
  def sort_cards
    # @cards.sort! { |a, b| a.show_value <=> b.show_value }
    @cards.sort_by! { |card| card.show_value }
  end
end

# require_relative 'card'
# cards = []

# Card::SUITS.each do |suit|
#   Card::NAMES.each_with_index do |name, index|
#    cards << Card.new(suit + name => Card::VALUES[index])
#   end
# end

# plaer = Person.new('Ruslan')

# # 52.times do |i|
#   # plaer.add_card(cards[i])
# # end
# plaer.add_card(cards[12])
# plaer.add_card(cards[25])
# plaer.add_card(cards[10])

# puts plaer.name

# plaer.show_cards

# plaer.total_points
# puts
# puts plaer.cards

# p plaer.points
# puts '=================================='

# dealer = Person.new

# 5.times do |i|
#   dealer.add_card(i)
# end

# puts dealer.name

# dealer.show_cards
