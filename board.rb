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

  def add_piece(piece, pos)
    raise "Not empty space" unless empty?(pos)
    self[pos] = piece
  end

  def valid_move?(pos)
    return false if empty?(pos)
    true
  end

  def empty?(pos)
    self[pos].empty?
  end

  def move_piece(start_pos, end_pos)
    raise 'Invalid move!' unless valid_move?(start_pos)

    piece = self[start_pos]
    self[start_pos] = sentinel
    self[end_pos] = piece
    piece.pos = end_pos
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

  def pieces
    @rows.flatten.reject(&:empty?)
  end

  def find_king(color)
    king = pieces.find { |p| p.is_a?(King) && p.color == color }
    king.pos || (raise "King not found")
  end

  def in_check?(color)
    king_pos = find_king(color)
    opp_pieces = pieces.select { |p| p.color != color }

    opp_pieces.each do |p|
      return true if p.moves.include?(king_pos)
    end

    false
  end

  private

  attr_reader :sentinel

  def fill_back(color)
    back_pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]
    
    x = color == :white ? 7 : 0

    back_pieces.each_with_index do |piece, y|
      piece.new(color, self, [x,y])
    end
  end

  def fill_front(color)
    x = color == :white ? 6 : 1
    8.times { |y| Pawn.new(color, self, [x,y]) }
  end

  def make_starting_grid
    @rows = Array.new(8) { Array.new(8, sentinel) }

    %i(white black).each do |color|
      fill_back(color)
      fill_front(color)
    end
  end
end