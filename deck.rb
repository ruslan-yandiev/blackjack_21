class Deck
  def initialize
    @cards = []
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
end
