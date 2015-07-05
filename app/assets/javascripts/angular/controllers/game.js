app.controller('GameCtrl', ['$scope', 'Movies', function($scope, Movies) {
  $scope.movies = Movies.all();
}]);