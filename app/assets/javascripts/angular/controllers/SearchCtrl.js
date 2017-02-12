app.controller('SearchCtrl', ['$scope', 'ApiFactory', function($scope, ApiFactory){
  $scope.searches = [];
   
  $scope.performSearch = function() {
  	var geocoder = new Geocoder($scope.postcode);
    geocoder.geocode($scope.queryCrime);
  };  
  
  $scope.queryCrime = function(geocoding){
    if (geocoding.error == false){
      $scope.response = ApiFactory.query({path: 'crimes-rate', query: 'lat='+geocoding.lat+'&lng='+geocoding.lng},
       function(crimes){
          crimes_data = crimes[0]; 
          $scope.total= crimes_data.total;
          $scope.statistics = crimes_data.statistics;
          addSearch();	
        });
    }
    else if (geocoding.error == true){
      $scope.error = geocoding.errorText;
      $scope.total = '?';
      addSearch();
    }   
  };
  
  function addSearch(){
   $scope.searches.push({postcode: $scope.postcode, total: $scope.total});
   $scope.postcode='';$scope.error='';
  }
  
}]);