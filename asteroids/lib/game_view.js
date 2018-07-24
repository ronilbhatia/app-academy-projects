const Game = require("./game.js");

function GameView () {
  const canvasEl = document.getElementById("game-canvas");
  this.ctx = canvasEl.getContext("2d");
  this.game = new Game();
}

GameView.prototype.start = function () {
  let game = this;
  setInterval(function (){
    game.game.draw(game.ctx);
    game.game.moveObjects();
  }, 20);
};

module.exports = GameView;