require_relative 'piece'

class Pawn < Piece
  def symbol
    '♟︎'.colorize(color)
  end

  def moves
    forward_steps + side_attacks
  end

  private

  def at_start_row?
    pos[0] == (color == :white) ? 6 : 1
  end

  def forward_dir
    color == :white ? -1 : 1
  end

  def forward_steps
    x, y = pos
    moves = []
    single_step = [x + forward_dir, y]
    return [] unless board.valid_pos?(single_step) && board.empty?(single_step)

    moves << single_step

    double_step = [x + 2 * forward_dir, y]
    moves << double_step if at_start_row? && board.empty?(double_step)

    moves
  end

  def side_attacks
    []
  end
end