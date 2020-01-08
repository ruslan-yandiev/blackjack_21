require_relative 'interface'
include Interface

start

loop do
  print 'Если хотите продолжить игру нажмите Enter:'

  option = gets.chomp
  break unless option == ''

  new_start
end

