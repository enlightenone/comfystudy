var app = angular.module("myApp",[]);

// app.config(
// function($locationProvider) {
// // change htm5 mode
//  $locationProvider.html5Mode(true);

//  // $locationProvider.html5Mode({
//  //        enabled: true,
//  //  requireBase: false
//  //  }).hashPrefix('');
// });


app.controller("testController",function($scope, $location){


  // $scope.limitclick = false

  $scope.url_path = location.search ;

  if ($scope.url_path.match(/limit=3/g)){
    $scope.limitclick = true ;

  }else{
    $scope.limitclick = false ;
  }


  $scope.test = function(flag){ 
      $scope.absolute_url = $location.absUrl() ;
    if (flag == true ){
       location.assign($scope.absolute_url + "&limit=3")
    }else if(flag == false){

     alert(location.search.replace(/&limit=3/g, ""));
     alert(location.href.replace(/&limit=3/g, ""));

      // $scope.urlpath = location.search ;
      // $scope.urlpath.replace(/&limit=3/g, "") ;
      // alert($scope.$scope.urlpath);
      location.assign(location.href.replace(/&limit=3/g, ""));
    }



  };


});