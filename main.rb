require_relative 'interface'
include Interface

create

loop do
  add_choice
  choice
  @deck.clear_deck
  @deck.add_card
  print "Хотите продолжить игру? есди да нажмите Enter: "
  choice = gets.chomp
  break unless choice == ''
end
