require 'byebug'
require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :display, :current_player, :players
  
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: Player.new(:white, @board, @display),
      black: Player.new(:black, @board, @display)
    }
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      players[current_player].move
      
      swap_turn
    end
  end

  def swap_turn
    @current_player = 
      current_player == :white ? :black : :white
  end
end

if ARGV[0] == "-d"
  puts "Debug mode"
  sleep(1)
elsif $PROGRAM_NAME == __FILE__
  Game.new.play
end