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