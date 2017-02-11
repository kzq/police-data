/*
 * Google maps api is required 
 * It gets address and returns coordinates
 * of the address
 */
function Geocoder(address){
	this.address = address;
    result = {};
    this.geocode = function (callback) {
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({address: this.address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          result.lat = results[0].geometry.location.lat();
          result.lng = results[0].geometry.location.lng();
          result.error = false;
          callback(result);
        }else { 
          result.error = true;
          result.errorText = "The Geocode was not successful for the following reason: " + status;
          callback(result);
        }
      });
    };
};