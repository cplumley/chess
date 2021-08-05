require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable
  def symbol
    '♞'
  end

  protected

  def move_diffs
    
  end
end