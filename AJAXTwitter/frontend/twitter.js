const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet_compose.js');

$( () => {
  const $buttons = $("button");
  const buttons = [];
  $buttons.each( (i, button) => {
    let currButton = new FollowToggle($(button));
    buttons.push(currButton);
  });
  
  const $search = $('.users-search');
  new UsersSearch($search);
  
  const $tweet = $('.tweet-compose');
  new TweetCompose($tweet);
  
});