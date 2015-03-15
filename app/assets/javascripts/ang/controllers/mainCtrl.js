(function () {

    disruption.controller('mainCtrl', function ($scope, disruptionsFactory) {

        $scope.map = {center: {latitude: 51.503, longitude: -0.1431}, zoom: 12};

        $scope.options = {scrollwheel: false};

        $scope.mapMarkers = [];

        function init() {
            disruptionsFactory.getDisruptions()
                .success(function(disruptions){
                    $scope.disruptions = disruptions;
                })
                .error(function (data, status) {
                    alert("Error when was loading js data: " + status)
                });
        }
        init();


        //var addMarkers = function($scope) {
        //
        //    angular.forEach($scope.disruptions, function(location, index) {
        //        var marker = new google.maps.Marker({
        //            map: $scope.map,
        //            position: new google.maps.LatLng(location.coords.latitude, location.coords.longitude),
        //            title: location.title
        //        });
        //        $scope.mapMarkers.push(marker);
        //    });
        //
        //};



    });

}());


