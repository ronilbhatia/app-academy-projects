const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.$input = $el.find("input");
    this.$ul = $el.find("ul");
    this.$input.on('keyup', this.handleInput.bind(this));
  }
  
  handleInput(e) {
    
    APIUtil.searchUsers(this.$input.val(), foundUsers => {
      $('.users').empty();
      
      foundUsers.forEach( user => {
        const $li = $(`<li><a href='/users/${user.id}'>${user.username}</a></li>`);
        const $button = $('<button type="button" class="follow-toggle" name="follow"></button>');
        $li.append($button);
        
        new FollowToggle($button, {
          'userId': user.id,
          'initialFollowState': user.followed
        });
        
        
        $('.users').append($li);
      });
    });  
 
  }    
}      
module.exports = UsersSearch;