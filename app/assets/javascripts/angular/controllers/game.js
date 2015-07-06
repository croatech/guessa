app.controller('GameCtrl', function($scope, Restangular, Games) {

  // init
  $scope.gameStatus = "ready"
  $scope.score = 0

  $scope.startGame = function(userId) {
    Games.create(userId);

    Restangular.one('users', userId).all('games').getList().then(function(current_game) {
      $scope.current_game = current_game.sort().reverse()[0];
    });

    $scope.gameStatus = "processing";
  };

  $scope.getMovies = function() {
    Restangular.all('movies').getList().then(function(movies) {
      $scope.secret = movies[0]
      $scope.movies = shuffle(movies)
    });
  };

  $scope.checkAnswer = function(answerId, $index) {
    if ($scope.secret.id == answerId) {
      $scope.score += 1
      $scope.rightAnswer = $index // set css style for right answer
      $scope.getMovies()
      removeBorder()

      // record update
      $scope.current_game.score = $scope.score
      $scope.current_game.put()
    } else {
      $scope.wrongAnswer = $index // set css style for wrong answer
      removeBorder()
    };
  };

});