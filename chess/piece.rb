require 'Singleton'
require 'colorize'
require_relative 'stepping_module'
require_relative 'sliding_module'

class Piece
  attr_reader :type, :move_dirs

  def initialize(type)
    @type = type
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @type = "Null"
  end
end

class Pawn < Piece
  def initialize
    super("Pawn")
  end
end

class King < Piece
  include Stepping
  MOVES = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1],
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]
  def initialize
    super("King")
  end
end

class Queen < Piece #King/Knight
  include Sliding

  def initialize
    super("Queen")
    @move_dirs = :both
  end
end

class Rook < Piece
  include Sliding

  def initialize
    super("Rook")
    @move_dirs = :h_v
  end

end

class Bishop < Piece
  include Sliding

  def initialize
    super("Bishop")
    @move_dirs = :diag
  end
end

class Knight < Piece
  include Stepping

  MOVES = [
    [-2, -1],
    [-2, 1],
    [1, -2],
    [1, 2],
    [2, 1],
    [2, -1],
    [-1, 2],
    [-1, -2]
  ]
  def initialize
    super("knight")
  end
end
