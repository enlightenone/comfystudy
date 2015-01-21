var app = angular.module("myApp",[]);

app.controller("testController",function($scope, $location){

  //default options flags variables
  $scope.wificlick = false ; 
  $scope.librariesclick = false ;
  $scope.cafesclick = false;
  $scope.collegeclick = false

  // Function to preserve check mark when reloading.
  $scope.reloadCheck = function(){
    $scope.url_path = location.search ;

    $scope.wificlick = $scope.url_path.match(/wifi=yes/g) ? true : false; 
    $scope.librariesclick = $scope.url_path.match(/libraries=yes/g) ? true : false; 
    $scope.cafesclick = $scope.url_path.match(/cafes=yes/g) ? true : false; 
    $scope.collegeclick = $scope.url_path.match(/college=yes/g) ? true : false; 
  };

  // invoke reloadCheckß method
  $scope.reloadCheck();

 // This function is to append param key to url path based on filter options being checks.
  $scope.optionsFilter = function(flag, option){ 

     //set param key based on option from check mark
  switch (option) {
    case "wifi":
        $scope.keyword = "&wifi=yes" ;
        $scope.keywordrg = /&wifi=yes/g ;
        break ;
    case "libraries":
        $scope.keyword = "&libraries=yes" ;
        $scope.keywordrg = /&libraries=yes/g ;
        break;
    case "cafes":
        $scope.keyword = "&cafes=yes" ;
        $scope.keywordrg = /&cafes=yes/g ;
        break;
    case "college":
        $scope.keyword = "&college=yes" ;
        $scope.keywordrg = /&college=yes/g ;
        break;
       } 

     
  $scope.absolute_url = $location.absUrl() ; //obtain full url path

  // to append or delete param key based on checkmark 
    if (flag == true ){
       location.assign($scope.absolute_url + $scope.keyword )
    }else if(flag == false){
      location.assign(location.href.replace($scope.keywordrg, ""));
    }
  };




});