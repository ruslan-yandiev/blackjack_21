class Dealer < Person
  def analysis(card)
    if @points > rand(15..17)
      puts skip_move
    else
      add_card(card)
    end
  end
end
