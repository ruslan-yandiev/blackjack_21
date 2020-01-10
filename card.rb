# frozen_string_literal: true

# class Card
class Card
  attr_reader :name, :value

  SUITS =  %w[♠ ♥ ♣ ♦].freeze
  NAMES =  %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].freeze

  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "Название карты: #{name}, Количество очков: #{value}"
  end
end
