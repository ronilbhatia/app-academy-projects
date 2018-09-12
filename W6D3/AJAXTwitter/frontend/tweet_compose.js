const APIUtil = require("./api_util.js");

class TweetCompose {
  constructor($el) {
    this.$el = $el;
    this.$content = $el.find($("textarea"));
    this.$mentions = $el.find($("select"));
    this.$el.on('submit', this.submit.bind(this));
  }
  
  submit(e) {
    e.preventDefault();
    
    let data = this.$el.serializeJSON();
    APIUtil.createTweet(data, () => {  
      console.log("success");
    });
  }
}

module.exports = TweetCompose;