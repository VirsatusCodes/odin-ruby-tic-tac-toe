# frozen_string_literal: true

# board item
class Board
  attr_accessor :board, :player_one, :player_two
  attr_reader :winner

  def initialize(player_one, player_two)
    # [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']] <- this is the visual creation
    @board = Array.new(3) { Array.new(3, ' ') }
    # @board = [['O', 'O', 'O'], [' ', ' ', ' '], [' ', ' ', ' ']]
    @player_one = player_one
    @player_two = player_two
    @winner = nil
  end

  def display_board
    @board.each do |row|
      puts row.map { |cell| cell.empty? ? ' ' : cell }.join(' | ')
      puts '-' * 9 unless row.equal?(@board.last)
    end
  end

  def update_board(new_move, player_icon)
    @board[new_move[0]][new_move[1]] = player_icon
  end

  def current_legal_moves
    moves = []
    @board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        moves.push([i, j]) if cell == ' '
      end
    end
    @player_one.legal_moves = moves
    @player_two.legal_moves = moves
  end

  def all_same_non_space_elements?(array)
    array.uniq.length == 1 && array.first != ' '
  end

  def check_row
    @board.each do |row|
      @winner = identify_winner(row.uniq[0]) if all_same_non_space_elements?(row)
    end
  end

  def check_column
    @board.transpose.each do |col|
      @winner = identify_winner(col.uniq[0]) if all_same_non_space_elements?(col)
    end
  end

  def check_diagonals
    diagonals = [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
    diagonals.each do |diag|
      @winner = identify_winner(diag.uniq[0]) if all_same_non_space_elements?(diag)
    end
  end

  def identify_winner(winner_icon)
    return unless winner_icon

    winner = nil

    if @player_one.icon == winner_icon
      winner = @player_one
    elsif @player_two.icon == winner_icon
      winner = @player_two
    end
    winner
  end

  def check_for_winner
    check_row
    check_column
    check_diagonals

    return unless @winner

    puts "Congrats, the winner is #{@winner.name}"
  end
end
