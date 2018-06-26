require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    8.times do |i|
      symbol_arr = []
      @board.grid[i].each_with_index do |piece, j| 
        if [i, j] == @cursor.cursor_pos
          symbol_arr << symbolize(piece).colorize(:blue)
        else
          symbol_arr << symbolize(piece)
        end
      end
      puts symbol_arr.join("|")
    end
  end
  
  def symbolize(piece)
    piece.type[0]
  end
end 

if __FILE__ == $PROGRAM_NAME 
  board = Board.new 
  display = Display.new(board)
  while true 
    display.render 
    display.cursor.get_input  
  end 
end 