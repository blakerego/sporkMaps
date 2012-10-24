require 'digest'
class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :encrypted_password
  attr_accessor :password, :password_confirmation, :salt

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
  					:format => { :with => email_regex },
  					:uniqueness => { :case_sensitive => false}

  validates :password, :presence => true, 
  						:confirmation => true,
  						:length => { :within => 6..40 }
  before_save :encrypt_password

  def has_password? (submitted_password)
  	#compare encrypted_password with the encrypted version of submitted_password
  	encrypt(submitted_password) == self.encrypted_password
  end

  private
  	def encrypt_password
  		self.salt = make_salt if new_record? 
  		self.encrypted_password = encrypt(password)
  	end

  	def encrypt(string)
  		secure_hash("#{salt}--#{string}")
  	end

  	def make_salt
  		secure_hash("#{Time.now.utc}--#{password}")
  	end

  	def secure_hash(string)
  		Digest::SHA2.hexdigest(string)
  	end
end