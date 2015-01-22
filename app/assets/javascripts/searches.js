var app = angular.module("myApp",[]);

app.controller("testController",function($scope, $location){

  //default options flags variables
  // $scope.wificlick = false ; 
  // $scope.librariesclick = false ;
  // $scope.cafesclick = false;
  // $scope.collegeclick = false

  // Function to preserve check mark when reloading.
  $scope.reloadCheck = function(){
    $scope.url_path = location.search ;

    $scope.wificlick = $scope.url_path.match(/wifi=yes/g) ? true : false; 
    $scope.librariesclick = $scope.url_path.match(/libraries=yes/g) ? true : false; 
    $scope.cafesclick = $scope.url_path.match(/cafes=yes/g) ? true : false; 
    $scope.collegeclick = $scope.url_path.match(/college=yes/g) ? true : false; 

    //Category Sort Flag

    // if (!$scope.url_path.match(/sort=0/g) && !$scope.url_path.match(/sort=1/g) ){
    //     $scope.bestmatch_flag = false ;
    //     $scope.highestrate_flag = true ;

    // }

    // if ($scope.bestmatch_flag == null && $scope.highestrate_flag == null){
    //     $scope.bestmatch_flag = true ;
    //     $scope.highestrate_flag = false ;
    // } 
    // else {
    //   $scope.bestmatch_flag = $scope.url_path.match(/sort=0/g) ? true : false ;
    //   $scope.bestmatch_flag = $scope.url_path.match(/sort=1/g) ? false: true ;
    // }

      if ($scope.url_path.match(/sort=0/g)){
         $scope.bestmatch_flag = true ;
         $scope.highestrate_flag = false ;
      }else if ($scope.url_path.match(/sort=1/g)){
         $scope.bestmatch_flag = false ;
         $scope.highestrate_flag = true ;
      }else{
         $scope.bestmatch_flag = true ;
         $scope.highestrate_flag = false ;
      }


      // $scope.bestmatch_flag = $scope.url_path.match(/sort=0/g) ? true : false ;
      // $scope.highestrate_flag = $scope.url_path.match(/sort=0/g) ? false : true;
      // $scope.highestrate_flag = $scope.url_path.match(/sort=1/g) ? true: false;
      // $scope.bestmatch_flag = $scope.url_path.match(/sort=1/g) ? false: true ;

  };

  // invoke reloadCheck method
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

 $scope.sortFunction = function(option){
        $scope.absolute_url = $location.absUrl() ; //obtain full url path

     if (option == "bestmatch"){
        if ($scope.url_path.match(/&sort=1/g)){
              location.assign(location.href.replace(/&sort=1/g, "&sort=0"));
            }else {
             location.assign($scope.absolute_url + "&sort=0" )
            }
          $scope.bestmatch_flag = true
          $scope.highestrate_flag = false

     }else if(option == "highestrate"){
        if ($scope.url_path.match(/&sort=0/g)){
              location.assign(location.href.replace(/&sort=0/g, "&sort=1"));
            }else {
          location.assign($scope.absolute_url + "&sort=1" )
           }
          $scope.bestmatch_flag = false
          $scope.highestrate_flag = true

     }
 };
 


});