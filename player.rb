# frozen_string_literal: true

# class Player
class Player < Person
  NAME_FORMAT = /^[а-яa-z]+\D/i.freeze

  def initialize(name)
    super
    validete
  end

  def validete
    raise 'Name has invalid format' if @name !~ NAME_FORMAT
  end
end
