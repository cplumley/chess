require_relative 'pieces'

class Board
  attr_reader :rows
  
  def initialize
    @sentinel = NullPiece.instance
    make_starting_grid()
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

  def valid_pos?(pos)
    x, y = pos
    
    if x < 0 || x > 7
      return false
    elsif y < 0 || y > 7
      return false
    end
    
    true
  end

  private

  attr_reader :sentinel

  def fill_back(color)
    back_pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]
    
    x = color == :white ? 7 : 0

    back_pieces.each_with_index do |piece, y|
      self[[x,y]] = piece.new(color, self, [x,y])
    end
  end

  def fill_front(color)
    x = color == :white ? 6 : 1
    8.times do |y| 
      self[[x,y]] = Pawn.new(color, self, [x,y])
    end
  end

  def make_starting_grid
    @rows = Array.new(8) { Array.new(8, sentinel) }

    %i(white black).each do |color|
      fill_back(color)
      fill_front(color)
    end
  end
end