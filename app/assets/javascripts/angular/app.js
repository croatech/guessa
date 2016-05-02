var app = angular.module('Guessa', ['restangular'])
  .config(function (RestangularProvider) {
    
   RestangularProvider.setRequestSuffix('.json');
});

