require 'open-uri'
require 'foursquare'

class AuthenticateController < ApplicationController

	def index
		puts 'in the index method of the authenticate controller.'
		accessToken = getAccessToken(params)
		venue = Foursquare::Venue.new(accessToken)
		
		#rawMovingTargets = venue.search({:ll => "40.7619,-73.9763",:categoryId => "4f2a23984b9023bd5841ed2c",:intent => "browse", :radius => "100000"})
		#rawMovingTargets = venue.search({:ll => "40.7619,-73.9763",:categoryId => "4f2a23984b9023bd5841ed2c"})
		rawMovingTargets = venue.search({:near => "Manhattan", :categoryId => "4f2a23984b9023bd5841ed2c"})

		filtered = filterResults(rawMovingTargets["response"]["venues"])
		render :json => filtered
		#render :json => rawMovingTargets
	end

	def filterResults(results)
		puts 'filtering results...'
		filtered = []
		results.each do |venue|

			categories = venue["categories"]
			categories.each do |category|
				categoryName = category['name'].to_s
				if (categoryName.include? "food" or categoryName.include? "Food")
					puts 'name: ' + venue["name"]
					puts 'category name**: ' + categoryName
					puts ''
					filtered.append(venue)
				end
			end
		end
		return filtered
	end

	def getAccessToken(params)
		accessToken = ''
		begin
			puts 'in the getAccessToken method of the authenticate controller'
			clientId = '00WU15WUYS1QBU0LW0ZKXRUYUS0PJKRCLLI5SMECYELN25BX'
			clientSecret = '2CYYKMTA045GUROSNCIOJOKR4SUIQWOYILVLNZGCXR1AKKND'
			redirectUri = 'http://localhost:3000/authenticate/'
			access_token_uri = 'https://foursquare.com/oauth2/access_token?client_id=' + 
			  clientId + '&client_secret=' + 
			  clientSecret + '&grant_type=authorization_code&redirect_uri=' + redirectUri + '&code='+
			  params[:code]

	  		getresult = open(access_token_uri, "UserAgent" => "Ruby-OpenURI").read
	  		accessToken = JSON.parse(getresult)['access_token']
  		rescue
  			puts 'failed to retrieve access token.'
  		end
  		return accessToken
	end
end
