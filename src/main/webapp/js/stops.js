/**
 * 
 */
var map;
function initialize() {
	var lat = document.getElementById("latitude").value;
	var lon = document.getElementById("longitude").value;
	if(lat == "" || lon == ""){
		lat = 12.31122;
		lon = 76.65875;
	}
	var myLatlng = new google.maps.LatLng(lat, lon);
	var myOptions = {
		zoom : 15,
		center : myLatlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	map = new google.maps.Map(document.getElementById("gmap"), myOptions);
	// marker refers to a global variable
	marker = new google.maps.Marker({
		position : myLatlng,
		map : map
	});
		
	var searchBox = new google.maps.places.SearchBox(document.getElementById('pac-input'));
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(document.getElementById('pac-input'));
	google.maps.event.addListener(searchBox, 'places_changed', function() {
	  searchBox.set('map', null);

	  var places = searchBox.getPlaces();

	  var bounds = new google.maps.LatLngBounds();
	  var i, place;
	  for (i = 0; place = places[i]; i++) {
	    (function(place) {
	      var marker = new google.maps.Marker({

	        position: place.geometry.location
	      });
	      marker.bindTo('map', searchBox, 'map');
	      google.maps.event.addListener(marker, 'map_changed', function() {
	        if (!this.getMap()) {
	          this.unbindAll();
	        }
	      });
	      bounds.extend(place.geometry.location);


	    }(place));

	  }
	  map.fitBounds(bounds);
	  searchBox.set('map', map);
	  map.setZoom(Math.min(map.getZoom(),12));

	});
	
	google.maps.event.addListener(map, "click", function(event) {
		// get lat/lon of click
		var clickLat = event.latLng.lat();
		var clickLon = event.latLng.lng();

		// show in input box
		document.getElementById("latitude").value = clickLat.toFixed(5);
		document.getElementById("longitude").value = clickLon.toFixed(5);
				
		var marker = new google.maps.Marker({
			position : new google.maps.LatLng(clickLat, clickLon),
			map : map
		});
	});
}

window.onload = function() {
	initialize()
};