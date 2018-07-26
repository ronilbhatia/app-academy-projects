/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      method: 'POST',
      url: `/users/${id}/follow`,
      dataType: 'json'
    });
  },
  
  unfollowUser: id => {
    return $.ajax({
      method: 'DELETE',
      url: `/users/${id}/follow`,
      dataType: 'json'
    });
  },
  
  searchUsers: (queryVal, success) => {
    return $.ajax({
      url: '/users/search',
      data: {
        'query': queryVal
      },
      success: success,
      dataType: 'json'
    });
  },
  
  createTweet: (data, success) => {
    return $.ajax({
      url: '/tweets',
      method: 'POST',
      data,
      dataType: 'json',
      success
    });
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

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

/***/ }),

/***/ "./frontend/tweet_compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet_compose.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

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

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js");
const TweetCompose = __webpack_require__(/*! ./tweet_compose.js */ "./frontend/tweet_compose.js");

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

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

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

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map