(function() {
  var disruptionsFactory = function($http) {

      var factory = {};

      factory.getDisruptions = function() {
          return $http.get('/disruptions.json');
      };

      return factory;
  };

    disruptionsFactory.$inject = ['$http'];

    disruption.factory('disruptionsFactory', disruptionsFactory);

}());
