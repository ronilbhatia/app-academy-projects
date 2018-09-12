class View {
  constructor(game, $el) {
    this.game = game;
    $el.append(this.setupTowers());
    // this.bindEvents();
  }
  
  setupTowers() {
    let $towers = $("<ul></ul>");
    
    let $tower1 = $("<ul><li></li><li></li><li></li></ul>");
    let $tower2 = $("<ul></ul>");
    let $tower3 = $("<ul></ul>");
    
    $towers.append($tower1);
    $towers.append($tower2);
    $towers.append($tower3);
    
    return $towers;
  }
  
  render() {
    // show
  }
}