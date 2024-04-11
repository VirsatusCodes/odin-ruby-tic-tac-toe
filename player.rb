# frozen_string_literal: true

# player module defines name and move order
module Player
  attr_reader :name, :first_move

  def initialize(name, first_move)
    @name = name
    @first_move = first_move
  end
end
