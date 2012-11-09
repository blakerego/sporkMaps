require 'spec_helper'

describe User do
	before(:each) do 
		@attr = { :email => "test45@testmail.com", :password => "password" }
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


	describe "remember token" do 
		before(:each) do
			@user = User.create(@attr)
		end

		it "should have a remember_token" do 
			@user.remember_token.should_not be_blank
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

		describe "has_password? method" do 
			it "should be true if the passwords match" do 
				@user.has_password?(@attr[:password]).should be_true
			end

			it "should be false if the passwords don't match" do 
				@user.has_password?("non_match").should be_false
			end
		end

		describe "authenticate method" do 
			it "should return nil on email/ password mismatch" do
				wrong_password_user = User.authenticate(@attr[:email], "wrongPass")
				wrong_password_user.should be_nil
			end

			it "should return nil for an email address with no user" do 
				nonexistent_user = User.authenticate("blah@blah.com", @attr[:password])
				nonexistent_user.should be_nil
			end

			it "should return the user on email/password match" do 
				puts '\n\n\n\n***************************************'
				matching_user = User.authenticate(@attr[:email], @attr[:password])
				matching_user.should == @user
			end 
		end
	end
end
