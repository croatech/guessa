app.factory('Games', function(Restangular) {

  return {
    allGames: function() {
      return Restangular.all('games').getList().$object;
    },
    allMovies: function() {
      return Restangular.all('movies').getList().$object;
    }
  };
});