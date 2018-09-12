let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];
  for (let i = 0; i < 8; i++) {
    grid.push([]);
    for(let j = 0; j < 8; j++) {
      grid[i].push(undefined);
    }
  }
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');
  
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0) {
    return false;
  }
  
  return true;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  const MOVES = [
    [1,0],
    [1,-1],
    [0,-1],
    [-1,-1],
    [-1,0],
    [-1,1],
    [0,1],
    [1,1],
  ];
  let has_move = false;
  let real_this = this;
  for(let i = 0; i < real_this.grid.length; i++) {
    for(let j = 0; j < real_this.grid.length; j++) {
      const curr_piece = real_this.getPiece([i, j]);
      if (curr_piece && curr_piece.color === color) {
                  console.log("---")
        MOVES.forEach(function(move) {
          const vector = [move[0], move[1]];
          let new_pos = [i+vector[0], j+vector[1]];
          console.log(new_pos);
          console.log("------")
          if (real_this.isValidPos(new_pos) && !real_this.isMine(new_pos, color && !real_this.isOccupied(new_pos))) {
            let new_new_pos = new_pos;
            while(true) {
              new_new_pos = [new_new_pos[0] + vector[0], new_new_pos[1] + vector[1]];
              console.log("NEW_NEW_POS:")
              console.log(new_new_pos);
              if (!real_this.isValidPos(new_new_pos) || real_this.isMine(new_new_pos, color)) {
                break;
              }
              console.log(!real_this.isOccupied(new_new_pos))
              if (!real_this.isOccupied(new_new_pos)) {
                has_move = true;
                // return true;
              }
            }
          }
        });
      }
    }
  }
  return has_move;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  piece = this.getPiece(pos);
  if (piece && piece.color === color) {
    return true;
  }
  
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos) === undefined) {
    return false;
  }
  
  return true;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};



/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

module.exports = Board;
