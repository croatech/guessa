app.factory('gameService', gameService);

function gameService(Restangular, $http) {
  var service = {
      create    : create,
      getMovies : getMovies,
      getGames  : getGames,
      getLast   : getLast
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

  function getLast() {
    var host = location.host;

    return $http.get('http://' + host + '/games/get_last.json') 
      .success(function(data) {
        return data;
      })
      .error(function(err) {
        return err;
      });
  };
}