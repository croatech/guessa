app.factory('Movies', function(Restangular) {

  return {
    all: function() {
      return Restangular.all('movies').getList().$object;
    }
  };
});