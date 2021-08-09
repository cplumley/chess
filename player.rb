class Player
  attr_reader :display, :board, :color

  def initialize (color, board, display)
    @color, @board, @display = color, board, display
  end

  def move
    start_pos, end_pos = nil, nil
    until start_pos && end_pos
      display.render
      if start_pos
        puts "#{color}'s turn. Move to where?"
        end_pos = display.get_input
      else
        puts "#{color}'s turn. Move from where?"
        start_pos = display.get_input
      end
    end
    board.move_piece(start_pos, end_pos)
  end
end