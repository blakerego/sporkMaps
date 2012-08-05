class AuthenticateController < ApplicationController
	def index
	  output = {'foo' => 'bar', 'code' => params[:code]}.to_json
	  render :json => output
	end
end
