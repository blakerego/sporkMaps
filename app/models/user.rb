require 'digest'
class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :encrypted_password, :salt
  attr_accessor :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
  					:format => { :with => email_regex },
  					:uniqueness => { :case_sensitive => false }

  validates :password, :presence => true, 
  						:confirmation => true,
  						:length => { :within => 6..40 }
  before_save :encrypt_password
  before_save :create_remember_token

  def has_password? (submitted_password)
  	#compare encrypted_password with the encrypted version of submitted_password
  	puts 'submitted_password: ' + submitted_password
  	puts 'encrypt(sumbitted_pw): ' + encrypt(submitted_password)
  	puts 'encrypted password: ' + encrypted_password
  	encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
  	user = find_by_email(email)
  	return nil if user.nil?
  	return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


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