# frozen_string_literal: true

# class Person
class Person
  attr_reader :cards, :name, :money, :points

  def initialize(name = nil)
    @name = name || 'dealer'
    @cards = []
    @money = 100
    @points = 0
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
    puts " * * \n"
  end

  def bet
    change_money
    10
  end

  def change_money
    @money -= 10
  end

  def add_money(money)
    @money += money
  end

  def skip_move
    "\n#{@name} пропускает ход\n\n"
  end

  def total_points
    sort_cards
    @cards.each { |card| point_plus(card) }
  end

  def restart_points
    @points = 0
  end

  def clear_cards
    @cards.clear
  end

  protected

  def point_plus(card)
    if card.show_name.include?('A')
      if @points > 10 && @points != 21
        @points += 1
      elsif @points == 21
        @points -= 9
      else
        @points += 11
      end
    else
      @points += card.show_value
    end
  end

  def sort_cards
    @cards.sort_by!(&:show_value)
  end
end
