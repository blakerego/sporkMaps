require 'spec_helper'

describe User do
	before(:each) do 
		@attr = { :email => "test@testmail.com", :password => "password" }
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

	describe "password validations" do 
		it "should require a password" do 
			User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid			
		end

		it "should require a matching password_confirmation" do 
			User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
		end

		it "should reject short passwords" do 
			s = "a"
			short = s*5; 
			User.new(@attr.merge(:password => short, :password_confirmation => short)).should_not be_valid
		end

		it "should reject long passwords" do 
			s = "b"
			long = s*41
			User.new(@attr.merge(:password => long, :password_confirmation => long)).should_not be_valid
		end
	end

	describe "password encryption" do 
		before(:each) do
			@user = User.create!(@attr)
		end

		it "should have an encrypted password attribute" do
			a = respond_to(:encrypted_password)
			a.should be_true
		end

		it "should set the encrypted password" do 
			@user.encrypted_password.should_not be_blank
		end
	end
end
