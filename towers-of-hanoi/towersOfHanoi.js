const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class TowersOfHanoi {
  run() {
    // until all of the disks are stacked on another peg
      // get move from current player
      // make move on board 
  }
  
  // getMove() {
    // render the board
    // ask player what peg they want to move from
    // ask player what peg they want to move to
    // verify valid move
    // console.log(this.towers);
    // let move = this.promptMove();
    // if (this.isValidMove(move[0], move[1])) {
    //   this.makeMove(move[0], move[1]);
    // } else {
    //   this.getMove();
    // }
  // }
  
  constructor () {
    this.towers = [[3,2,1], [], []];
  }
  
  getMove () {
    console.log(this.towers);
    // let towers = this.towers;
    reader.question("Which tower would you like to move FROM? (0, 1, 2)", function (fromTower) {
      reader.question("Which tower would you like to move TO? (0, 1, 2)", function (toTower) {
        // return [fromTower, toTower];
        console.log(this.towers);
        let move = [fromTower, toTower];
        if (this.isValidMove(move[0], move[1])) {
          this.makeMove(move[0], move[1]);
        } else {
          this.getMove();
        }
      });
    });
  }
  
  isValidMove (fromTower, toTower) {
    let fromTowerEl = this.towers[fromTower][this.towers[fromTower].length - 1];
    let toTowerEl = this.towers[toTower][this.towers[toTower].length - 1];
    if ((this.towers[fromTower].length === 0) || (fromTower === toTower)) {
      return false;
    } else if (fromTowerEl > toTowerEl) {
      return false;
    } else {
      return true;
    }
  }
  
  makeMove(fromTower, toTower) {
    let disc = this.towers[fromTower].pop();
    this.towers[toTower].push(disc);
  }
  
  isWon() {
    if ((this.towers[1].length === 3) || (this.towers[2].length === 3)) {
      return true;
    } else {
      return false;
    }
  }
}

let game = new TowersOfHanoi();
game.getMove();
console.log(this.towers);
reader.close();