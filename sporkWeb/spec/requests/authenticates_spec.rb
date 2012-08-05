require 'spec_helper'

describe "Authenticates" do
  describe "GET /authenticates" do
  	it "should be successful" do 
  		get 'authenticate'
  		response.should be_success
  	end
  end
end
