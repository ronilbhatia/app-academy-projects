const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$( () => {
  const $buttons = $("button");
  const buttons = [];
  
  const $search = $('.users-search');
  
  new UsersSearch($search);
  
  $buttons.each( (i, button) => {
    let currButton = new FollowToggle($(button));
    buttons.push(currButton);
  });
});