class StaticController < ApplicationController
	def index

		#puts APP_CONFIG['clientId']
		#@foursquareUrl = 'test'
		puts APP_CONFIG
		puts APP_CONFIG['clientId']
		puts APP_CONFIG['redirectUri']
		@foursquareUrl = 'https://foursquare.com/oauth2/authenticate?client_id=' + APP_CONFIG['clientId'] + '&response_type=code&redirect_uri=' + APP_CONFIG['redirectUri']
		puts @foursquareUrl
		render :html => @foursquareUrl
	end
end
