require 'foursquare'
clientId = '00WU15WUYS1QBU0LW0ZKXRUYUS0PJKRCLLI5SMECYELN25BX'
clientSecret = '2CYYKMTA045GUROSNCIOJOKR4SUIQWOYILVLNZGCXR1AKKND'
redirectUri = 'http://blakehome.nfshost.com/'

require 'open-uri'

redirectLink = "https://foursquare.com/oauth2/authenticate?client_id=" + 
clientId + "&response_type=code" +
"&redirect_uri=" + redirectUri

accessToken = "BHE42B2A5HHSJZMBIN2SWNALC2VFJPU5QLSQ2Y1CGDW1TALI"
venue = Foursquare::Venue.new(accessToken)
rawMovingTargets = venue.search({:ll => "40.7619,-73.9763", :categoryId => "4f2a23984b9023bd5841ed2c"})
nearbyMovingTargets = rawMovingTargets["response"]["groups"][0]["items"]
