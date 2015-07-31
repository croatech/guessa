app.controller('GameController', GameController)

function GameController($scope, Restangular, gameService) {
  var vm = this;

  // init
  vm.gameStatus = "ready";

  vm.firstHelpOption = true;
  vm.secondHelpOption = true;
  vm.thirdHelpOption = true;

  vm.startGame = function(userId) {
    vm.score = 0;
    vm.gameStatus = "processing";

    gameService.create(userId);

    gameService.getLast().then(function(res) {
      $currentGame = Restangular.one('games', res.data.id);
      console.log(userId);
      console.log(res.data.id);
    })
  }

  vm.getMovies = function() {
    Restangular.all('movies').getList().then(function(movies) {
      vm.secret = movies[0];
      vm.movies = shuffle(movies);
    })
  }

  vm.checkAnswer = function(answerId, $index) {
    if (vm.secret.id == answerId && vm.gameStatus != "finished") {
      vm.score += 1;
      vm.rightAnswer = $index; // set css style for right answer
      vm.getMovies();
      removeBorder();

      // record update
      $currentGame.score = vm.score;
      $currentGame.put();
    } else {
      vm.gameStatus = "finished";
      vm.wrongAnswer = $index ;// set css style for wrong answer
      vm.secretMovieTitle = vm.secret.title;
      removeBorder();
    }
  }

  vm.showRating = function() {
    vm.ratingShows = true;
    $scope.games_list = gameService.getGames();
  }

  vm.hideRating = function() {
    vm.ratingShows = false;
  }

  vm.getFiftyFifty = function() {
    vm.firstHelpOption = false;

    angular.forEach(vm.movies, function(value, key) {
      if (vm.movies[key]["title"] == vm.secret["title"]) {
        $indexSecretMovie = key;
      } else {
        false
      }
    })

    vm.movies.splice($indexSecretMovie, 1); // delete secret movie from an array
    vm.movies.unshift(vm.secret);       // put secret movie to an array on first place  
    vm.movies = vm.movies.slice(0, 2);  // deletes 2 last options(secret movie is first)
    vm.movies = shuffle(vm.movies);     // shuffle
  }

  vm.getSkipQuestion = function() {
    vm.secondHelpOption = false;
    vm.score += 1;
    vm.getMovies();

    // record update
    $currentGame.score = vm.score;
    $currentGame.put();
  }

  vm.getMistery = function() {
    vm.score = 0;
    vm.gameStatus = "finished";
    vm.showRating();
    vm.secret.image = "http://www.tnca.org/wp-content/uploads/2012/02/helloloser.jpg";
  }

}