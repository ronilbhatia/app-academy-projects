const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Asteroid (pos) {
  let options = {
    pos: pos,
    vel: Util.randomVec(2),
    color: "blue",
    radius: 5    
  };
  
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
