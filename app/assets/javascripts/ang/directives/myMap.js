disruption.directive('myMap', function(disruptionsFactory) {
    var link = function(scope, element, attrs) {
        var map, infoWindow;
        var markers = [];


        var mapOptions = {
            center: new google.maps.LatLng(51.5190291,-0.1108684),
            zoom: 12,
            scrollwheel: false
        };


        function initMap() {
            if (map === void 0) {
                map = new google.maps.Map(element[0], mapOptions);
            }
        }


        function setMarker(map, position, title, content, endTime) {
            var marker;
            var markerOptions = {
                position: position,
                map: map,
                title: title,
                icon: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png'
            };

            marker = new google.maps.Marker(markerOptions);
            markers.push(marker);

            google.maps.event.addListener(marker, 'click', function () {

                if (infoWindow !== void 0) {
                    infoWindow.close();
                }
                var infoWindowOptions = {
                    content: "<p>" + title + "</p>"  +  "<p>" + content + "</p>" +  "<p>End:" + endTime + "</p>"
                };
                infoWindow = new google.maps.InfoWindow(infoWindowOptions);
                infoWindow.open(map, marker);
            });
        }

        function init(map) {
            disruptionsFactory.getDisruptions()
                .success(function (disruptions) {
                    angular.forEach(disruptions, function (location, index) {
                        setMarker(map, new google.maps.LatLng(location.CauseArea.latitude, location.CauseArea.longitude),
                            location.status, location.comments, location.endTime);
                    });

                })
                .error(function (data, status) {
                    alert("Error when was loading js data: " + status)
                });
        }
        initMap();
        init(map);

    };

    return {
        restrict: 'A',
        template: '<div id="gmaps"></div>',
        replace: true,
        link: link
    };
});