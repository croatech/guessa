app.factory('gameService', gameService);

function gameService(Restangular) {
  var service = {
      create    : create,
      getMovies : getMovies,
      getGames  : getGames
  };

  return service;
  /////////////////////////

  function create(userId) {
    return Restangular.all('games').post({user_id: userId});
  };

  function getMovies() {
    return Restangular.all('movies').getList().$object;
  };

  function getGames() {
    return Restangular.all('games').getList().$object;
  };
}