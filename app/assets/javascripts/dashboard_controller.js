angular.module('taskApp.controllers.dashBoardController', [])
  .controller('dashBoardController', ['$scope', '$http' ,function($scope,$http){
    var controller = this;
    $scope.taskName = "";
    this.editAssignment = function(task){
      $scope.showTaskEditForm = true;
      $scope.taskName = task.name;
      $scope.userModel = task.user_id;
      $scope.task_id = task.id
    };
    $scope.submit = function() {
      $scope.changedUser  = this.userModel;
      $scope.taskName= this.taskName;
      var submitData = {authenticity_token: this.authToken, task: {user_id: this.userModel, name: this.taskName} };

      $http.put('/tasks/'+ $scope.task_id+'.json',submitData).
        success(function (data, status, headers, config) {
          controller.onSuccessTaskData(data);
          $scope.showTaskEditForm = false;
        }).
     error(function (data, status, headers, config) {
          $scope.showTaskEditForm = true;
       });
    }
    this.onSuccessTaskData = function(data){
      task = eval('$scope.task_'+data.id);
      user = controller.findUser(data.user_id);
      task.user = user;
      task.id = data.id;
      task.user_id = data.user_id;
      task.name = data.name;
      task.description = data.description;
    }

    this.findUser = function(userId){
      user = null;
      angular.forEach($scope.users, function(_user) {
        if(_user.id == userId){
          user = _user;
          return _user;
        }
      });
      return user;
    }
  }]
  );