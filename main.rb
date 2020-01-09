# frozen_string_literal: true

require_relative 'game'

game = Game.new

loop do
  print 'Если хотите продолжить игру нажмите Enter:'

  option = gets.chomp
  break unless option == ''

  game.new_start
end
