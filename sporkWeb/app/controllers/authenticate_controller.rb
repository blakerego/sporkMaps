require 'open-uri'

class AuthenticateController < ApplicationController

	def index
		clientId = '00WU15WUYS1QBU0LW0ZKXRUYUS0PJKRCLLI5SMECYELN25BX'
		clientSecret = '2CYYKMTA045GUROSNCIOJOKR4SUIQWOYILVLNZGCXR1AKKND'
		redirectUri = 'http://localhost:3000/authenticate/'
		access_token_uri = 'https://foursquare.com/oauth2/access_token?client_id=' + 
		  clientId + '&client_secret=' + 
		  clientSecret + '&grant_type=authorization_code&redirect_uri=' + redirectUri + '&code='+
		  params[:code]

	  	getresult = open(access_token_uri, "UserAgent" => "Ruby-OpenURI").read
		output = {'foo' => 'bar', 'code' => params[:code], 'accessToken' => JSON.parse(getresult)['access_token']}.to_json
		render :json => output
	end


end