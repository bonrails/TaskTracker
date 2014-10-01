angular.module('taskApp.controllers.mainController', [])
  .controller('MainController', ['$scope', '$location' ,function($scope, $location){
    $scope.goto = function(path){
      window.location.href = path;
    }
  }]
  );