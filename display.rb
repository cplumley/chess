require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor
  
  def initialize (board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def get_input
    cursor.get_input
  end

  def build_grid
    board.rows.map.with_index do |row, x|
      build_row(row, x)
    end
  end

  def build_row(row, x)
    row.map.with_index do |piece, y|
      color_options = colors_for(x,y)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(x, y)
    if [x, y] == cursor.cursor_pos && cursor.selected
      bg = :yellow
    elsif [x, y] == cursor.cursor_pos
      bg = :magenta
    elsif (x + y).odd?
      bg = :cyan
    else
      bg = :red
    end
    { background: bg }
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end
end