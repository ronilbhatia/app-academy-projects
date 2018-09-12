const View = require("./ttt-view.js");// require appropriate file
const Game = require("../nodeSolution/game.js");// require appropriate file

$( () => {
  let g = new Game();
  let $view = $("figure.ttt");
  new View(g, $view);
});
