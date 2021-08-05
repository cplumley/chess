require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable
  
  def symbol
    '♜'.colorize(color)
  end

  private

  def move_dirs
    horizontal_and_vertial_dirs
  end
end