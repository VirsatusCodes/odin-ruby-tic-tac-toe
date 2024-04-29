# frozen_string_literal: true

require_relative 'player'

class Computer
  include Player

  def initialize(name, icon)
    super(name, icon)
    @generated_smack_talk = [
      'My Previous versions may have lost to you, but not me.',
      "You couldn't beat an ENIAC with that gameplay.",
      "You're only real hope is a Tie against one such as myself.",
      "I have computed all of your possible moves, you can't win.",
      "Hey it's okay to lose, I dont exactly have a lifespan I can be here all day"
    ]
  end

  def provide_smack_talk
    @generated_smack_talk[rand(@generated_smack_talk.length)]
  end

  def provide_action
    # if you role a 0 smack talk before making a move
    smack_talk if rand(2).zero?
    move
  end

  def provide_move
    @legal_moves[rand(@legal_moves.length)]
  end
end
