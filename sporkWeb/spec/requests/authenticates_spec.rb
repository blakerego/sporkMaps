require 'spec_helper'

describe "Authenticates" do
  describe "GET /authenticates" do
  	it "should return json." do 
  		get 'authenticate'
  		parsed_body = JSON.parse(response.body)
  		parsed_body["foo"].should == "bar"
  	end
  end
end
