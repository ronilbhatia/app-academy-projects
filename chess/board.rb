require_relative 'piece.rb'
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    set_up
  end

  def set_up
    set_up_row(@grid[0])
    @grid[1].map! { Pawn.new }
    @grid[6].map! { Pawn.new }
    set_up_row(@grid[7])
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    unless valid_move?(start_pos, end_pos)
      raise "Invalid move"
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def valid_move?(start_pos, end_pos)
    if start_pos.any? {|n| n < 0 || n > 7}
      raise "Move is not on board"
    elsif end_pos.any? {|n| n < 0 || n > 7}
      raise "Move is not on board"
    elsif self[start_pos].is_a?(NullPiece)
      raise "There is no piece at this starting position"
    end


    return true
  end

  def valid_pos?(pos)
    return false if pos.any? {|n| n < 0 || n > 7}
    true
  end
  private

  def set_up_row(row)
    row.each_index do |i|
      if i == 0 || i == 7
        row[i] = Rook.new
      elsif i == 1 || i == 6
        row[i] = Knight.new
      elsif i == 2 || i == 5
        row[i] = Bishop.new
      elsif i == 3
        row[i] = Queen.new
      else
        row[i] = King.new
      end
    end
  end
end
