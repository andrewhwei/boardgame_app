(function () {
  "use strict";

  angular.module("app").controller("boardgamesCtrl", ['$scope', '$http', function($scope, $http) {

  $scope.setup = function() {
    $http.get("/api/v1/boardgames.json").then(function(response) {
      $scope.boardgames = response.data;
    });
  }

  $scope.deleteBoardgame = function(boardgame) {
    $http.delete("/api/v1/boardgames/" + boardgame.id + ".json").then(function(response) {
      var index = $scope.boardgames.indexOf(boardgame);
      $scope.boardgames.splice(index, 1);
    });
  }

  window.$scope = $scope;
  }]);
})();