require_relative 'piece'
require_relative 'stepable'

class King < Piece
  implements Stepable
  
  def symbol
    '♚'
  end

  protected

  def move_dirs
    
  end
end