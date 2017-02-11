app.controller('SearchCtrl', ['$scope', 'PoliceDataFactory', function($scope, PoliceDataFactory){
  $scope.search = {};
  
  $scope.performSearch = function() {
    $scope.search.error = '';
    var geocoder = new Geocoder($scope.search.postcode);
    geocoder.geocode($scope.queryCrime);
  };  
  
  $scope.queryCrime = function(geocoding){
    $scope.response = PoliceDataFactory.query({path: 'crimes-street/all-crime', query: 'lat='+geocoding.lat+'&lng='+geocoding.lng});
    if (geocoding.error == false){
      $scope.search.postcode = '';
    }
    else if (geocoding.error == true){
      $scope.search.error = geocoding.errorText;
    }   
  };
  $scope.crimes = {}; 

}]);