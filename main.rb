require_relative 'interface'
include Interface

start

loop do
  print "Хотите продолжить игру? есди да нажмите Enter: "

  option = gets.chomp
  break unless option == ''

  new_start
end

