require 'spec_helper'

describe "Authenticates" do
  describe "GET /authenticates/getAccessCode" do
  	it "should return json." do 
  		get 'authenticate'
  		parsed_body = JSON.parse(response.body)
  		parsed_body["foo"].should == "bar"
  	end

  	it "should take an argument named code" do 
  		get 'authenticate', :code => 'test code'
  		parsed_body = JSON.parse(response.body)
  		parsed_body["code"].should == "test code"
  	end

  end
end
