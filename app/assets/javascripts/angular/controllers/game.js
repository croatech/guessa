app.controller('GameCtrl', function($scope, Restangular, Games) {

  // init
  $scope.gameStatus = "ready"

  $scope.startGame = function(userId) {
    $scope.score = 0
    $scope.gameStatus = "processing";

    Games.create(userId);

    Restangular.one('users', userId).all('games').getList().then(function(current_game) {
      $scope.current_game = current_game.sort().reverse()[0];
    });
  };

  $scope.getMovies = function() {
    Restangular.all('movies').getList().then(function(movies) {
      $scope.secret = movies[0]
      $scope.movies = shuffle(movies)
    });
  };

  $scope.checkAnswer = function(answerId, $index) {
    if ($scope.secret.id == answerId && $scope.gameStatus != "finished") {
      $scope.score += 1
      $scope.rightAnswer = $index // set css style for right answer
      $scope.getMovies()
      removeBorder()

      // record update
      $scope.current_game.score = $scope.score
      $scope.current_game.put()
    } else {
      $scope.gameStatus = "finished"
      $scope.wrongAnswer = $index // set css style for wrong answer
      $scope.secretMovieTitle = $scope.secret.title;
      removeBorder()
    };
  };

  $scope.showRating = function() {
    $scope.ratingShows = true;

    $scope.games = [
      {
        "name":"fuck",
        score: 2
      },
      {
        "name":"fuck",
        score: 2
      }
    ]
  };
});