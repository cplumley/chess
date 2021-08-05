require_relative 'singleton'
require_relative 'piece'

class Rook < Piece
  attr_reader :symbol, :color
  include Singleton
  
  def initialize
    @symbol = " "
    @color = nil
  end

  def empty?
    true
  end

  def moves
    []
  end
end