var app = angular.module('Guessa', ['restangular'])
  .config(function (RestangularProvider) {
    
   RestangularProvider.setRequestSuffix('.json');
   RestangularProvider.setDefaultHttpFields({xsrfCookieName:'csrftoken', xsrfHeaderName:'X-CSRFToken'});
});

