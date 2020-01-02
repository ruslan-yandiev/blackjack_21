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
  # покажет объекты если имеется любое имя ирока кроме имени dealer, иначе вернот * в количестве имеющихся карт
  def show_cards
    @name == 'dealer' ? show_others : show_cards!
  end

  def show_cards!
    @cards.each { |card| puts card }
  end

  def show_others
    @cards.each { print ' * ' }
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
  # метод складывает очки за карты путем вызова высокозависимого метода
  def total_points
    # @cards.each(&@p_p) протестим
    @cards.each do |hh|
      hh.card.each { |value| @points += value[1]}
    end
    # @points = @cards.inject(0) { |accumulator, card| point_plus(accumulator, card) }
  end
  # изолированный метод, так-как высокая зависимость от инстанс метода класса Card
  def point_plus(card)#(arg, card)
    # @p_p = ->(x){ @points += x.show_value } протестим
    # @points += card.show_value
    # accumulator + card.show_value
  end
end

require_relative 'card'
cards = []

Card::SUITS.each do |suit|
  Card::NAMES.each_with_index do |name, index|
   cards << Card.new(suit + name => Card::VALUES[index])
  end
end

plaer = Person.new('Ruslan')

2.times do |i|
  plaer.add_card(cards[i])
end

puts plaer.name

plaer.show_cards

plaer.total_points

p plaer.points
# puts '=================================='

# dealer = Person.new

# 5.times do |i|
#   dealer.add_card(i)
# end

# puts dealer.name

# dealer.show_cards
