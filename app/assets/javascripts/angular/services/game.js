app.factory('Games', function(Restangular) {

  return {
    create: function(userId) {
      return Restangular.all('games').post({user_id: userId});
    },
    getMovies: function() {
      return Restangular.all('movies').getList().$object;  // GET: /users
    },
    incrementScore: function(gameId, score) {
      currentGame = Restangular.one('games', gameId).get()
      currentGame.score = 2;
      currentGame.put();
    }
  };

});