(function () {
  "use strict";

  angular.module("app").controller("boardgamesCtrl", function($scope, $http) {

  $scope.setup = function() {
    $http.get("/api/v1/boardgames.json").then(function(response) {
      $scope.boardgames = response.data;
    });
  }

  window.$scope = $scope;
  });
})();