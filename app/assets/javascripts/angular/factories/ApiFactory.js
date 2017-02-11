app.factory('ApiFactory', ['$resource', function($resource) {
  return $resource('/api/:path?:query',{path: '@path', query: '@query'});
}]);