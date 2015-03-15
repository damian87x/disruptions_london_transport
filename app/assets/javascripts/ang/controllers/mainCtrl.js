(function () {

    disruption.controller('mainCtrl', function ($scope, disruptionsFactory) {
        $scope.map = {center: {latitude: 51.219053, longitude: 4.404418}, zoom: 14};
        $scope.options = {scrollwheel: false};

        function init() {
            disruptionsFactory.getDisruptions()
                .success(function(disruptions){
                    $scope.disruptions = disruptions;
                })
                .error(function(data, status, headers, config){
                    alert("Error when was loading js data: "+ status)
                });
        }

        init();

    });

}());