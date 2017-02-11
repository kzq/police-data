/*
 * Google maps api is required 
 * It gets address and returns coordinates
 * of the address
 */
function Geocoder(address){
	this.address = address;
    
    this.geocode = function (callback) {
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode({address: this.address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          this.lat = results[0].geometry.location.lat();
          this.lng = results[0].geometry.location.lng();
          callback(this.lat,this.lng);
        }else { 
          alert("The Geocode was not successful for the following reason: " + status);
        }
      });
    };
};