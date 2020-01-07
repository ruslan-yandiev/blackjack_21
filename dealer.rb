class Dealer < Person
  def analys(card)
    @card ||= card
    if @points > 16 || @cards.size > 2
      puts skip_move
    else
      puts 'дилер взял карту'
      add_card(@card)
    end
  end
end
