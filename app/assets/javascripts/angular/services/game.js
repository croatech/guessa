app.factory('gameService', gameService);

function gameService(Restangular) {
  var service = {
      create    : create,
      getMovies : getMovies,
      getGames  : getGames
  };

  return service;
  /////////////////////////

  function create() {
    return Restangular.all('games').post();
  };

  function getMovies() {
    return Restangular.all('movies').getList();
  };

  function getGames() {
    return Restangular.all('games').getList().$object;
  };
}