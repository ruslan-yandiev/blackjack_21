# frozen_string_literal: true

# class Dealer
class Dealer < Person
  def analys(card)
    total_points if @points.zero?

    if @points > 16 || @cards.size > 2
      0
    else
      add_card(card)
      restart_points
      total_points
    end
  end
end
