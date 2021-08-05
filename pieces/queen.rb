require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  implements Slideable
  
  def symbol
    '♛'
  end

  private

  def move_dirs
      horizontal_and_vertial_dirs + diagonal_dirs
  end
end