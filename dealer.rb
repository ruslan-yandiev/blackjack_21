class Dealer < Person
  def analys(card)
    total_points

    if @points > 16 || @cards.size > 2
      puts skip_move
    else
      add_card(card)
      puts "Дилер взял карту: #{cards[2]}"
      restart_points
      total_points
    end
  end
end
