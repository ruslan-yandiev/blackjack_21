class Dealer < Person
  attr_accessor :sum

  def analysis(card)
    @sum = 0

    if @points > 16 || sum > 0
      puts skip_move
    elsif sum.zero?
      @sum += 1
      add_card(card)
      total_points
    end
  end
end
