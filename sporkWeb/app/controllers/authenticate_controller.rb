require 'open-uri'
require 'foursquare'

class AuthenticateController < ApplicationController

	def index
		begin
			puts 'in the index method of the authenticate controller'
			clientId = '00WU15WUYS1QBU0LW0ZKXRUYUS0PJKRCLLI5SMECYELN25BX'
			clientSecret = '2CYYKMTA045GUROSNCIOJOKR4SUIQWOYILVLNZGCXR1AKKND'
			redirectUri = 'http://localhost:3000/authenticate/'
			access_token_uri = 'https://foursquare.com/oauth2/access_token?client_id=' + 
			  clientId + '&client_secret=' + 
			  clientSecret + '&grant_type=authorization_code&redirect_uri=' + redirectUri + '&code='+
			  params[:code]

	  		getresult = open(access_token_uri, "UserAgent" => "Ruby-OpenURI").read
	  		accessToken = JSON.parse(getresult)['access_token']
			
			venue = Foursquare::Venue.new(accessToken)
			rawMovingTargets = venue.search({:ll => "40.7619,-73.9763", :categoryId => "4f2a23984b9023bd5841ed2c"})

			output = {'foo' => 'bar', 'code' => params[:code], 'accessToken' => accessToken, 
				'rawMovingTargets'=> rawMovingTargets}.to_json


		rescue 
			output = {'foo' => 'bar', 'code' => params[:code], 'accessToken' => 'for test'}.to_json
		end
		render :json => rawMovingTargets["notifications"]
	end

	def getAccessCode
		begin
			clientId = '00WU15WUYS1QBU0LW0ZKXRUYUS0PJKRCLLI5SMECYELN25BX'
			clientSecret = '2CYYKMTA045GUROSNCIOJOKR4SUIQWOYILVLNZGCXR1AKKND'
			redirectUri = 'http://localhost:3000/authenticate/'
			access_token_uri = 'https://foursquare.com/oauth2/access_token?client_id=' + 
			  clientId + '&client_secret=' + 
			  clientSecret + '&grant_type=authorization_code&redirect_uri=' + redirectUri + '&code='+
			  params[:code]

	  		getresult = open(access_token_uri, "UserAgent" => "Ruby-OpenURI").read
	  		accessToken = JSON.parse(getresult)['access_token']
			
			venue = Foursquare::Venue.new(accessToken)
			rawMovingTargets = venue.search({:ll => "40.7619,-73.9763", :categoryId => "4f2a23984b9023bd5841ed2c"})

			output = {'foo' => 'bar', 'code' => params[:code], 'accessToken' => accessToken, 
				'rawMovingTargets'=> rawMovingTargets}.to_json
		rescue 
			output = {'foo' => 'bar', 'code' => params[:code], 'accessToken' => 'for test'}.to_json
		end
		render :json => output		
	end
end
