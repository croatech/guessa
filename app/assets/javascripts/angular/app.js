var app = angular.module('Guessa', ['restangular'])
  .config(function (RestangularProvider) {

   RestangularProvider.setBaseUrl("http://guessmovie.herokuapp.com");
   RestangularProvider.setRequestSuffix('.json');
   RestangularProvider.setDefaultHttpFields({xsrfCookieName:'csrftoken', xsrfHeaderName:'X-CSRFToken'});
});

