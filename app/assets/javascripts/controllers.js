angular.module('taskApp.controllers',[
  'taskApp.controllers.dashBoardController',
  'taskApp.controllers.mainController'
]);


function Cntrl ($scope,$location) {
  $scope.changeView = function(view){
    $location.path(view); // path not hash
  }
}