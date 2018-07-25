const FollowToggle = require('./follow_toggle.js');

$( () => {
  const $buttons = $("button");
  const buttons = [];
  
  $buttons.each( (i, button) => {
    let currButton = new FollowToggle($(button));
    buttons.push(currButton);
  });
});