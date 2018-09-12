class View {
  constructor(game, $el) {
    this.game = game;
    $el.append(this.setupBoard());
    this.bindEvents();
  }

  bindEvents() {
    let that = this;
    $("li").on("click", (e) => {
      let $currentTarget = $(e.currentTarget);
      this.makeMove($currentTarget, that);
    });
  }

  makeMove($square, that) {
    let pos = $square.data("data-pos");
    if ($square.css("background-color") === "rgb(255, 255, 0)") {
      this.game.playMove(pos);
      $square.addClass("click");
      $square.text(this.game.currentPlayer);
      if (this.game.currentPlayer === "X") {
        $square.css("color", "green");
      } else {
        $square.css("color", "red");
      }

      // let game = this;
      if (this.game.board.winner()) {
        console.log(`Congratulations ${this.game.currentPlayer}`);
        let $message = $(`<h2>Congratulations ${this.game.currentPlayer} wins!</h2>`);
        $("body").append($message);
        // return 'Congratulations';
        $("li").off("click");
        // , (e) => {
        // //   let $currentTarget = $(e.currentTarget);
        // //   that.makeMove($currentTarget, that);
        // });
        $("li").removeClass(":hover");
        $("li").addClass("null");
      }
    } else if ($square.css("background-color") === "rgb(255, 255, 255)") {
      alert('Invalid move');
    }
    const $listItems = $("li");
    // console.log("end");

  }

  setupBoard() {
    const $grid = $("<ul></ul>");
    let rowIdx = 0;
    let colIdx = 0;
    for (let i = 0; i < 9; i++) {
      if (i === 3 || i === 6) {
        rowIdx++;
      }
      if (colIdx === 3) {
        colIdx = 0;
      }
      let $listEl = $("<li></li>");
      $listEl.data("data-pos", [rowIdx, colIdx]);

      $grid.append($listEl);
      colIdx++;
      // $(".ttt").append($grid);
    }
    return $grid;
  }

}

module.exports = View;
