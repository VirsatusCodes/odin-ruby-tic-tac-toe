# frozen_string_literal: true

require_relative 'player'

class Human
  include Player

  def get_action
    puts "Hey #{name}, what would you like to do?
          0) Smack Talk
          1) Move
          2) Give Up"
    action = gets.chomp.to_i

    if action.zero?
      smack_talk
      move
    elsif action == 1
      move
    elsif action == 2
      give_up
    else
      puts 'Invalid action. Please enter 0, 1, or 2.'
      get_action
    end
  end

  def get_smack_talk
    puts 'You wanna talk some smack huh? what do you wanna say?'
    gets.chomp
  end

  def get_move
    display_moves

    move_choice = gets.chomp.to_i

    @legal_moves[move_choice]
  end

  def give_up
    puts "I acknowledge my own inferiority and
    lack of ability to win, I give up. (Rerun the
    file to retry, I am too lazy to code a reset into
    this command I just thought it was funny)"
  end

  def display_moves
    puts 'Your legal moves are:'

    @legal_moves.each_with_index do |move, index|
      puts "#{index}) #{move}"
    end
  end
end
