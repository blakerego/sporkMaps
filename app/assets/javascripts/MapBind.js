

mMap = null; 

function bindMap(accessToken){
	loadScript(); 
	$.ajax({
	  url: "http://localhost:3000/food_truck?accessToken=" + accessToken,
	  context: document.body
	}).done(function(data) { 
		mMarkerData = data;
		for(var x=0; x<data.length; x++) 
		{
			createMarker(data[x]);
		}    
	});
}

function createMarker(venue)
{
	var myLatlng = new google.maps.LatLng(
		venue["location"]["lat"],
		venue["location"]["lng"]);

	var mapOptions = {
		zoom: 4,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var marker = new google.maps.Marker({
		position: myLatlng,
		map: mMap,
		title: venue["name"]
	});
}

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(40.7619,-73.9763),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  mMap = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDkwduooUJwQbaXS3wdgbspCjBg6WRx5jw&sensor=true&callback=initialize";
  document.body.appendChild(script);
}

