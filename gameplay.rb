# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'
require_relative 'board'

computer = Computer.new('Computron', 'Zed')
player = Human.new('Donavyn', 'O')
board = Board.new(player, computer)

def seperate_actions
  seperate_actions_counter = 15
  seperate_actions_counter.times do
    print '/'
  end
  puts
end

def player_loop(board)
  board.player_one.legal_moves = board.current_legal_moves
  board.update_board(board.player_one.get_action, board.player_one.icon)

  seperate_actions
  puts 'You changed the board to'
  seperate_actions

  board.display_board
end

def computer_loop(board)
  board.player_one.legal_moves = board.current_legal_moves
  board.update_board(board.player_two.provide_action, board.player_two.icon)

  seperate_actions
  puts 'Youre enemy made the board'
  seperate_actions

  board.display_board
end

def gameplay_loop(board, first_loop)
  board.display_board if first_loop

  player_loop(board)
  winner = board.check_for_winner
  return winner if winner

  seperate_actions

  computer_loop(board)
  board.check_for_winner
end

first_loop = true
loop do
  break if gameplay_loop(board, first_loop)

  first_loop = false
end
