function MovingObject (options) {
  this.pos = options.pos;
  this.vel = options.vel;
  if (this.radius === undefined) {
    this.radius = 5;
  } else {
    this.radius = options.radius;
  }
  
  if (this.color === undefined) {
    this.color = 'blue';
  } else {
    this.color = options.color;
  }
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fillstyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] = this.pos[0] + this.vel[0];
  this.pos[1] = this.pos[1] + this.vel[1];
};

module.exports = MovingObject;