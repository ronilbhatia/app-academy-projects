require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display
  SYMBOLS = {
    queen: "♛",
    rook: "♜",
    bishop: "♝",
    knight: "♞",
    king: "♚",
    pawn: "♟",
    null: " ",
  }
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    puts "\n"
    puts "------------------------------"
    8.times do |i|
      symbol_arr = []
      @board.grid[i].each_with_index do |piece, j|
        if [i, j] == @cursor.cursor_pos
          symbol_arr << symbolize(piece).colorize(:color => :light_blue, :background => :red)
        else
          symbol_arr << symbolize(piece)
        end

      end
      puts symbol_arr.join(" | ")
      puts "------------------------------"
    end
  end

  def symbolize(piece)
    SYMBOLS[piece.type.downcase.to_sym]
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
