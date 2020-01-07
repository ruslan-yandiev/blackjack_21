class Person
  attr_reader :cards, :name, :money, :points

  def initialize(name = nil)
    @name = name || 'dealer'
    @cards = []
    @money = 100
    @points = 0
  end
  # метод добавляет по одному объекту класса Card в массив
  def add_card(card)
    @cards << card
  end
  # покажет объекты если имеется любое имя ирока кроме имени dealer, иначе вернёт * в количестве имеющихся карт
  def show_cards
    @name == 'dealer' ? show_others : show_cards!
  end

  def show_cards!
    @cards.each { |card| puts card }
  end

  def show_others
    puts " * * \n"
  end
  # метод делает ставку
  def bet
    change_money
    10
  end
  # метод вычитает поставленные деньги
  def change_money
    @money -= 10
  end

  def add_money(money)
    @money += money
  end

  def skip_move
    "\n#{@name} пропускает ход\n\n"
  end
  # метод складывает очки за карты путем вызова высокозависимого метода
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
    if card.show_name.include?("A")
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
  # метод сортирует массив с картами так, чтобы последними были всегда тузы, для гибкого подсчета очков
  def sort_cards
    @cards.sort_by! { |card| card.show_value }
  end
end
