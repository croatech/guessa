app.controller('GameCtrl', ['$scope', 'Games', function($scope, Games) {
  $scope.gameStatus = "ready"; // init

  $scope.movies = Games.allMovies();

  $scope.startGame = function(user_id) {
    $scope.gameStatus = "processing";
    $scope.id = user_id;
  };
}]);