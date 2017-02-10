app.controller('MenuCtrl',function($scope,$location){
    $scope.isActive = function(path){
        var paths = $location.path();
        //alert(paths);
        if($location.path() == path){
        //    alert('sss');
            return true;
        } else {
        //	alert('aaa');
            return false;
        }
    };
});