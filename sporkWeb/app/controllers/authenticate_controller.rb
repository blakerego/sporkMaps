require 'open-uri'
require 'foursquare'

class AuthenticateController < ApplicationController

	def index
		puts 'in the index method of the authenticate controller.'
		accessToken = getAccessToken(params)
		puts 'access token uri: ' + accessToken

		venue = Foursquare::Venue.new(accessToken)
		
		#### This is for all moving targets -- 4f2a23984b9023bd5841ed2c
		rawMovingTargets = venue.search({:ll => "40.7619,-73.9763", :categoryId => "4f2a23984b9023bd5841ed2c"})

		filtered = []

		results = rawMovingTargets["response"]["venues"]
		results.each do |venue|
			puts 'name: ' + venue["name"]
			puts 'categories: '
			categories = venue["categories"]

			categories.each do |category|
				categoryName = category['name'].to_s
				puts 'category name**: ' + categoryName
				if (categoryName.include? "food" or categoryName.include? "Food")
					puts '**********************************************************'
					filtered.append(venue)
				end
			end

			puts 'stats: '
			#stats = venue["stats"]
			#stats.each do |stat|
			#	puts 'checkinsCount: ' + stat["checkinsCount"]
			#	puts 'usersCount: ' + stat["usersCount"]
			#	puts 'tipCount: ' + stat["tipCount"]
			#end
			puts ''
		end

		render :json => filtered
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
