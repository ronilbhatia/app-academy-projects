module Sliding
  def moves
    moves = []
    case self.move_dirs
    when :h_v
      start_pos = self.pos
    when :diag
    when :both
    end
  end
end