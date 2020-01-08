# frozen_string_literal: true

require_relative 'interface'

Interface.start

loop do
  print 'Если хотите продолжить игру нажмите Enter:'

  option = gets.chomp
  break unless option == ''

  Interface.new_start
end
