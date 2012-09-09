

function bindMap(accessToken){
	alert(accessToken) ;

	$.ajax({
	  url: "http://localhost:3000/food_truck?accessToken=" + accessToken,
	  context: document.body
	}).done(function() { 
		alert('ajax response returned.'); 
	});
}