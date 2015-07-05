var app = angular.module('Guessa', ['restangular'])
  .config(function (RestangularProvider) {

   RestangularProvider.setBaseUrl("http://localhost:3000");
   RestangularProvider.setRequestSuffix('.json');
});