# frozen_string_literal: true

# board item
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    @board.each do |row|
      puts row.map { |cell| cell.empty? ? ' ' : cell }.join(' | ')
      puts '-' * 9 unless row.equal?(@board.last)
    end
  end

  def current_legal_moves
    moves = []
    @board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        moves.push([i, j]) if cell == ' '
      end
    end
    puts 'Your current legal moves are -> ' + moves.to_s
  end

  def check_for_winner

end

board = Board.new
board.display
board.current_legal_moves

def check_for_winner #possible implementation, study and understand first
    # Check rows and columns
    3.times do |i|
      return @board[i][0] if @board[i].uniq.length == 1 && @board[i][0] != ' '
      return @board[0][i] if @board.map { |row| row[i] }.uniq.length == 1 && @board[0][i] != ' '
    end
  
    # Check diagonals
    if (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != ' ') ||
       (@board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[0][2] != ' ')
      return @board[1][1]
    end
  
    # No winner
    nil
  end