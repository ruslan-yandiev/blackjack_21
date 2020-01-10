# frozen_string_literal: true

require_relative 'game'

loop do
  game = Game.new

  loop do
    print 'Если хотите продолжить игру нажмите Enter:'

    option = gets.chomp
    break unless option == ''

    game.new_start
    break if game.game_overme == true
  end

  puts 'Хотите ли начать новую игру? (да/нет)'
  answer = gets.chomp

  break unless answer == 'да'
end
