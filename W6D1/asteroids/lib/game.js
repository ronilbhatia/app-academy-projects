function Game () {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 15;
  this.asteroids = [];
  
  this.addAsteroids();
}

Game.prototype.randomPosition = function() {
  return [Math.random() * 500, Math.random() * 500];
};

Game.prototype.addAsteroids = function () {
  let game = this;
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    game.asteroids.push(new Asteroid(game.randomPosition()));
  }
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, 500, 500);
  this.asteroids.forEach(function(el) {
    el.draw(ctx);
  }); 
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(function(el) {
    el.move();
  }); 
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");
  this.draw(ctx);
};

module.exports = Game;