require 'open-uri'
require 'foursquare'

class AuthenticateController < ApplicationController

	def index
		puts 'in the index method of the authenticate controller.'
		@accessToken = getAccessToken(params)
		render :html => @accessToken
	end

	def getAccessToken(params)
		accessToken = ''
		begin
			puts 'in the getAccessToken method of the authenticate controller'
			clientId = APP_CONFIG['clientId']
			clientSecret = APP_CONFIG['clientSecret']
			redirectUri = APP_CONFIG['redirectUri']
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
