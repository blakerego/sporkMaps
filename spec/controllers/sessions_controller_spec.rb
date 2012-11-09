require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    render_views

    it "returns http success" do
      get :new
      response.should be_success
    end

    # it "should have the right title" do 
    # 	get :new 
    # 	response.should have_selector("title", :content => "Sign in")
    # end
  end

  describe "POST 'create'" do

    describe "with valid email and password" do 
      before(:each) do 
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password}
      end

      it "should sign the user in" do 
        post :create, :session => @attr 

        #Fill in with tests for a signed in user. 
      end

      it "should redirect to the user show page" do 
        post :create, :session => @attr
        response.should redirect_to(user_path(@user))
      end

    end

    describe "invalid signin" do
      before(:each) do 
        @attr = { :email => "email@exmple.com", :password => "invalid" }
      end

      it "should re-render the new page" do 
        post :create, :session => @attr
        response.should render_template('new')
      end

      it "should have a flash.now message" do 
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end
  end
end
