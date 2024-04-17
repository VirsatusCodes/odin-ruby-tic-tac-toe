# frozen_string_literal: true

# player module defines name and move order
module Player
  attr_reader :name, :first_move, :icon

  attr_accessor :legal_moves

  def initialize(name, icon)
    @name = name
    @icon = icon
    @legal_moves = nil
  end

  def move
    if is_a?(Human)
      get_move
    elsif is_a?(Computer)
      provide_move
    end
  end

  def smack_talk
    if is_a?(Human)
      puts "HEY ENEMY! GUESS WHAT? #{get_smack_talk}"
    elsif is_a?(Computer)
      puts "Puny human, I have words of wisdom for you. #{provide_smack_talk}"
    end
  end

  def get_legal_moves(legal_moves)
    @legal_moves = legal_moves
  end
end
