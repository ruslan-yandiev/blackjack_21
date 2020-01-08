# frozen_string_literal: true

# class Deck
class Deck
  @@cards = []

  def initialize
    @cards = []
  end

  def self.add_card(card)
    @@cards << card
  end

  def add_card
    @@cards.each { |card| @cards << card }
  end

  def send_card
    @cards.delete_at(rand_index)
  end

  def rand_index
    rand(@cards.size)
  end

  def clear_deck
    @cards.clear
  end
end
