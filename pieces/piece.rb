require 'colorize'

class Piece
  attr_reader :board, :pos, :color
  
  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos

    board.add_piece(self, pos)
  end

  def moves

  end

  def pos=(val)
    @pos = val
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    false
  end

  def symbol
    raise NotImplementedError
  end

  private

  def move_into_check?(end_pos)

  end
end