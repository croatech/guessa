app.controller('UserController', UserController)

function UserController(Restangular, $window) {
  var vm = this;

  vm.sessionDestroy = function() {
    $window.location.href = '/users/session_destroy';
  }
}