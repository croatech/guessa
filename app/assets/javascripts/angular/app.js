var app = angular.module('Guessa', ['restangular', 'timer'])
  .config(function (RestangularProvider) {
    
   RestangularProvider.setRequestSuffix('.json');
});

