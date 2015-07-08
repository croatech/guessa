app.controller('GameCtrl', function($scope, Restangular, Games) {

  // init
  $scope.gameStatus = "ready"

  $scope.firstHelpOption = true
  $scope.secondHelpOption = true
  $scope.thirdHelpOption = true

  $scope.ratingButton = true

  $scope.startGame = function(userId) {
    $scope.score = 0
    $scope.gameStatus = "processing"

    Games.create(userId)

    Restangular.one('users', userId).all('games').getList().then(function(current_game) {
      $scope.current_game = current_game.sort().reverse()[0]
    })
  }

  $scope.getMovies = function() {
    Restangular.all('movies').getList().then(function(movies) {
      $scope.secret = movies[0]
      $scope.movies = shuffle(movies)
    })
  }

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
      $scope.secretMovieTitle = $scope.secret.title
      removeBorder()
    }
  }

  $scope.showRating = function() {
    $scope.ratingShows = true
    $scope.ratingButton = false
    $scope.games = Games.getGames()
  }

  $scope.hideRating = function() {
    $scope.ratingShows = false
    $scope.ratingButton = true
  }

  $scope.getFiftyFifty = function() {
    $scope.firstHelpOption = false

    angular.forEach($scope.movies, function(value, key) {
      if ($scope.movies[key]["title"] == $scope.secret["title"]) {
        $indexSecretMovie = key
      } else {
        false
      }
    })

    $scope.movies.splice($indexSecretMovie, 1) // delete secret movie from an array
    $scope.movies.unshift($scope.secret)       // put secret movie to an array on first place  
    $scope.movies = $scope.movies.slice(0, 2)  // deletes 2 last options(secret movie is first)
    $scope.movies = shuffle($scope.movies)     // shuffle
  }

  $scope.getSkipQuestion = function() {
    $scope.secondHelpOption = false
    $scope.score += 1
    $scope.getMovies()

    // record update
    $scope.current_game.score = $scope.score
    $scope.current_game.put()
  }

  $scope.getMistery = function() {
    $scope.score = 0
    $scope.gameStatus = "finished"
    $scope.showRating()
    $scope.secret.image = "http://www.tnca.org/wp-content/uploads/2012/02/helloloser.jpg"
  }

})