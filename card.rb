# class Card
class Card
  attr_reader :card

  SUITS =  %w[♠ ♥ ♣ ♦].freeze
  NAMES =  %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].freeze

  def initialize(card)
    @card = card
  end

  def show_value
    @card.values[0]
  end

  def show_name
    @card.keys[0]
  end

  def to_s
    "Название карты: #{show_name}, Количество очков: #{show_value}"
  end
end

# Card::SUITS.each do |suit|
#   Card::NAMES.each_with_index do |name, index|
#    p Card.new(suit + name => Card::VALUES[index])
#   end
# end
