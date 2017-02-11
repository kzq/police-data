app.factory('PoliceDataFactory', ['$resource', function($resource) {
  return $resource('https://data.police.uk/api/:path?:query',{path: '@path', query: '@query'});
}]);