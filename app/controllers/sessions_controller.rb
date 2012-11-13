class SessionsController < ApplicationController
  require 'sessions_helper'
  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
    sign_in user
  	if user.nil? 

  		puts "***************************************************"
  		puts '*********   FAILED TO AUTHENTICATE USER ***********'	
  		puts "***************************************************"

  		flash.now[:error] = "Invalid email / password combination"
  		@title = "Invalid email / password combination"
  		render 'new'
  	else
      puts "***************************************************"
      puts '*********   AUTHENTICATE SUCCESSFUL !   ***********'  
      puts "***************************************************"
  		redirect_to user
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
