class Deck
  @@cards = []

  def initialize
    @cards = []
  end
  # добавляем карты в массив
  def self.add_card(card)
    @@cards << card
  end
  # создает колоду карт у экземпляра
  def add_card
    @@cards.each { |card| @cards << card }
  end
  # возвращаем случайную карту из массива и при этом удаляем ее из массива
  def send_card
    @cards.delete_at(rand_index)
  end

  def rand_index
    rand(@cards.size)
  end
  # очищаем колоду экземпляра
  def clear_deck
    @cards.clear
  end
end
