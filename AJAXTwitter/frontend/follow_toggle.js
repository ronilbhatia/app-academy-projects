const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor ($el, options) {
    this.userId = $el.data('user-id') || options.userId;
    this.followState = $el.data('initial-follow-state') || options.initialFollowState;
    this.$el = $el;
    this.render();
    $el.on('click', this.handleClick.bind(this));
     // || $('<button type="button" class="follow-toggle" name="follow"></button>' );
  }
  
  render () {
    if (this.followState) {
      this.$el.text("Unfollow");
    } else {
      this.$el.text("Follow");
    }
    this.enableButton();
  }
  
  handleClick (e) {
    e.preventDefault();
    this.disableButton();
    const followPromise = () => { 
      if (this.followState) {
        return APIUtil.unfollowUser(this.userId);
      } else {
        return APIUtil.followUser(this.userId);
      }
    };
    
    followPromise().then(this.toggle.bind(this));
  }
  
  toggle () {
    this.followState = !this.followState;
    this.render();
  }
  
  disableButton() {
    this.$el.prop("disabled", true);
  }
  
  enableButton() {
    this.$el.prop("disabled", false);
  }
}


module.exports = FollowToggle;