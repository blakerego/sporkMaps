require 'spec_helper'

describe User do
	before(:each) do 
		@attr = { :email => "test@testmail.com" }
	end

	it "should create a new instance given valid attributes" do 
		User.create!(@attr)
	end

	it "should require an email" do 
		no_name_user = User.new(@attr.merge(:email => ""))
		no_name_user.should_not be_valid
	end

	it "should accept valid email addresses" do 
		addresses = %w[user@foo.com THE_USER@Foo.bar.org first.last@foo.jp]
		addresses.each do |address|
			valid_email_user = User.new(@attr.merge(:email => address))
			valid_email_user.should be_valid
		end
	end

	it "should reject invalid email addresses" do 
		addresses = %w[blake user@foo,com blake#ja.com blah@foo.]
		addresses.each do |address|
			valid_email_user = User.new(@attr.merge(:email => address))
			valid_email_user.should_not be_valid
		end
	end
end
