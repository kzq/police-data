app.controller('SearchCtrl', ['$scope', 'ApiFactory', function($scope, ApiFactory){
  $scope.search = {};
  $scope.lastSearch = {};
  $scope.recentSearches = [];
   
  $scope.performSearch = function() {
  	var geocoder = new Geocoder($scope.search.postcode);
    geocoder.geocode($scope.queryCrime);
  };  
  
  $scope.queryCrime = function(geocoding){
    $scope.crimes = ApiFactory.query({path: 'crimes-rate', query: 'lat='+geocoding.lat+'&lng='+geocoding.lng});
    if (geocoding.error == false){
      $scope.search.total = Object.keys($scope.crimes).length;
    }
    else if (geocoding.error == true){
      $scope.search.error = geocoding.errorText;
      $scope.search.total = '?';
    }   
    $scope.recentSearches.push($scope.search);
    $scope.lastSearch = $scope.search;
    $scope.search = {};
  };
 
}]);