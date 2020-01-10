# frozen_string_literal: true

# class Deck
class Deck
  def initialize
    @cards = []
    create_cards
  end

  def add_card(card)
    @cards << card
  end

  def send_card
    @cards.delete_at(rand_index)
  end

  def rand_index
    rand(@cards.size)
  end

  def create_cards
    Card::SUITS.each do |suit|
      Card::NAMES.each_with_index do |name, index|
        add_card(Card.new(suit + name, Card::VALUES[index]))
      end
    end
  end
end
