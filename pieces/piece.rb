require 'colorize'

class Piece
  attr_reader :board, :pos
  
  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def moves

  end

  def to_s

  end

  def empty?
    false
  end

  def valid_moves

  end

  def pos=(val)

  end

  def symbol

  end

  private

  def move_into_check?(end_pos)

  end
end