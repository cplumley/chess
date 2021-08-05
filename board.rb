require_relative 'pieces'

class Board
  attr_reader :rows
  
  def initialize
    @rows = Array.new(8) { Array.new(8) { Piece.new } } 
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def valid_move?(pos)
    if self[pos] == nil
      return false
    end
    
    true
  end

  def empty?(pos)
    self[pos].empty?
  end

  def move_piece(start_pos, end_pos)
    raise 'Invalid move!' unless valid_move?(start_pos)

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end
end