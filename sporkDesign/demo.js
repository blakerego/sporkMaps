$(document).ready(function () {
	// Wrap content
	WrapContent();

    // Cloud animation
    animateCloud();
});

function animateCloud(){
    $("#cloud").animate({ 'left': '900px' }, 180000, 'linear', function() {
        $(this).css('left', '-66px');
        animateCloud();
    });
}

function WrapContent(){
	// Capture the current content
	var content = $("body").html();
	
	// Create the outer most wrapper
	var wrap =  $("<div id='wrapper'></div>");
	
	// Create a header and add it to the outer wrapper
	var header =  $("<div id='wrapper'><div id='header'><div id='cloud' style='left: -64.1914px;'></div><span id='title'>BOB <span class='odd-word'>CRAVENS</span> DOTCOM</span><span id='subtitle'> Demo Page </span></div>");
	wrap.append(header);
	
	// Create the advertizing area and it to the outer wrapper		
	var advert = $("<div class='ad-wrap'><div class='lqm_ad' lqm_publisher='lqm.bobcraven.site' lqm_zone='ron' lqm_format='125x125'></div><div class='lqm_ad' lqm_publisher='lqm.bobcraven.site' lqm_zone='ron' lqm_format='125x125'></div><div class='lqm_ad' lqm_publisher='lqm.bobcraven.site' lqm_zone='ron' lqm_format='125x125'></div><div class='lqm_ad' lqm_publisher='lqm.bobcraven.site' lqm_zone='ron' lqm_format='125x125'></div><a href='http://lakequincy.com?1129' style='text-align:right;font-size:8px;display:block;text-decoration:none;font-family:Sans-Serif;margin:0;padding:0;'>Ads by Lake Quincy Media</a></div>");

	wrap.append(advert);
	
	// Create the content wrap, add the content, and then add the whole thing to the outer wrapper
	var contentWrap = $("<div id='content-wrap'></div>");
	contentWrap.append(content);
	wrap.append(contentWrap);
	
	// Replace the current content with the wrapped content
	$("body").html(wrap);
}

/*
Inserts the ads dynamically
*/
function lakeQuincyAds(){
	var s1 = document.createElement('script');
	s1.src='http://s1.lqcdn.com/m.min.js?dt=2.3.110202.1';
	s1.type = 'text/javascript';
	s1.onload = function(){
		if($.LqmAds)$.LqmAds();
	}
	document.getElementsByTagName('head')[0].appendChild(s1);
}
lakeQuincyAds();

/*
Inserts GA using DOM insertion of <script> tag and "script onload" method to
initialize the pageTracker object. Prevents GA insertion from blocking I/O!

As suggested in Steve Souder's talk. See:

http://google-code-updates.blogspot.com/2009/03/steve-souders-lifes-too-short-write.html

*/

/* acct is GA account number, i.e. "UA-5555555-1" */
function gaSSDSLoad (acct) {
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www."),
      pageTracker,
      s;
  s = document.createElement('script');
  s.src = gaJsHost + 'google-analytics.com/ga.js';
  s.type = 'text/javascript';
  s.onloadDone = false;
  function init () {
    pageTracker = _gat._getTracker(acct);
    pageTracker._trackPageview();
  }
  s.onload = function () {
    s.onloadDone = true;
    init();
  };
  s.onreadystatechange = function() {
    if (('loaded' === s.readyState || 'complete' === s.readyState) && !s.onloadDone) {
      s.onloadDone = true;
      init();
    }
  };
  document.getElementsByTagName('head')[0].appendChild(s);
}

/* and run it */
gaSSDSLoad("UA-9606082-1");