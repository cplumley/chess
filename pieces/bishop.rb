require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  implements Slideable
  
  def symbol
    '♝'.colorize(color)
  end

  private

  def move_dirs
    diagonal_dirs
  end
end