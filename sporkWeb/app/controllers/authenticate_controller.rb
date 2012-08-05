class AuthenticateController < ApplicationController
	def index
	  respond_to do |format|
	    format.json { render :json => "zombie" }
	  end
	end
end
