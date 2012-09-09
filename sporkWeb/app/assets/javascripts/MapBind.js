

function bindMap(accessToken){

	$.ajax({
	  url: "http://localhost:3000/food_truck?accessToken=" + accessToken,
	  context: document.body
	}).done(function() { 
		alert('ajax response returned.'); 
	});
}

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(40.7619,-73.9763),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDkwduooUJwQbaXS3wdgbspCjBg6WRx5jw&sensor=true&callback=initialize";
  document.body.appendChild(script);
}

window.onload = loadScript;