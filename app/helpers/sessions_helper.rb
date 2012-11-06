module SessionsHelper
	def sign_in(user)
  		puts "***************************************************"
  		puts "***************************************************"
  		puts "***************************************************"
  		puts '*********   CREATING COOKIE ***********************'	
  		puts "***************************************************"
  		puts "***************************************************"
  		puts "***************************************************"		
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
		puts self.current_user
	end

	def current_order=(order)
		@current_order = order
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		puts User.find_by_remember_token(cookies[:remember_token])
		@current_user ||= user_from_remember_token
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def signed_in? 
		!current_user.nil?
	end

	def has_order?
		!current_order.nil?
	end

	private 
		def user_from_remember_token
			User.authenticate_with_salt(*remember_token)
		end

		def remember_token
			cookies.signed[:remember_token] || [nil, nil]
		end
end
