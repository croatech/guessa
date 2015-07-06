app.factory('Games', function(Restangular) {

  return {
    create: function(userId) {
      return Restangular.all('games').post({user_id: userId});
    },
    getMovies: function() {
      return Restangular.all('movies').getList().$object;  // GET: /users
    }
  };

});