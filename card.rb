class Card
  attr_reader :name

  SUIT =  %w[♠ ♥ ♣ ♦].freeze
  NAMES =  %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]].freeze

  def initialize(name)
    @name = name
  end

  def show
    @name
  end
end

Card::SUIT.each do |typ|
  Card::NAMES.each_with_index do |name, index|
    p Card.new(typ + name => Card::VALUES[index])
  end
end
