app.controller('GameController', GameController)

function GameController(Restangular, gameService) {
  var vm = this;

  // init
  vm.gameStatus = "ready";

  vm.imageHostingUrl = "https://s3.amazonaws.com";

  vm.firstHelpOption = true;
  vm.secondHelpOption = true;
  vm.thirdHelpOption = true;

  vm.startGame = function() {
    vm.score = 0;
    vm.gameStatus = "processing";
    startTimeout();

    gameService.create().then(function(res) {
      $currentGame = res;
    })
  }

  vm.getMovies = function() {
    gameService.getMovies().then(function(movies) {
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
    vm.gamesList = gameService.getGames();
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
    vm.movies.unshift(vm.secret);           // put secret movie to an array on first place  
    vm.movies = vm.movies.slice(0, 2);      // deletes 2 last options(secret movie is first)
    vm.movies = shuffle(vm.movies);         // shuffle
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
    vm.imageHostingUrl = "http://www.tnca.org";
    vm.secret.image_file_name = "wp-content/uploads/2012/02/helloloser.jpg";
  }
}