class Person
  attr_reader :cards

  def initialize(name = nil)
    @name = name || 'dealer'
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def show_cards
    @name == 'dealer' ? show_others : show_cards!
  end

  def show_cards!
    @cards.each { |card| puts card }
  end

  def show_others
    @cards.each { puts '*' }
  end
end
