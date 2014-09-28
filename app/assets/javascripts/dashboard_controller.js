angular.module('taskApp.controllers.dashBoardController', [])
  .controller('dashBoardController', ['$scope', function($scope){
    var controller = this;
    $scope.taskName = "";
    this.editAssignment = function(task){
      $scope.taskName = task.name;
      $scope.userModel = task.user_id;
    };
    $scope.submit = function() {
       $scope.changedUser  = this.userModel
      $scope.taskName= this.taskName
    }
  }]
  );