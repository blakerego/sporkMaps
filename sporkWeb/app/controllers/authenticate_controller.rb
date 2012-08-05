class AuthenticateController < ApplicationController
	def index
	  puts 'hello'
	  output = {'foo' => 'bar'}.to_json
	  render :json => output
	end
end
