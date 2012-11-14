module SessionsHelper
	def sign_in(user)
  		puts "***************************************************"
  		puts "***************************************************"
  		puts "***************************************************"
  		puts '*********   CREATING SIGN IN COOKIE ***************'	
  		puts "***************************************************"
  		puts "***************************************************"
  		puts "***************************************************"		
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
		puts self.current_user
	end

	def cache_new_order(order)
  		puts "***************************************************"
  		puts "***************************************************"
  		puts "***************************************************"
  		puts '*********   CREATING ORDER COOKIE ***************'	
  		puts "***************************************************"
  		puts "***************************************************"
  		puts "***************************************************"		
		cookies.permanent.signed[:order_token] = order.id
		self.current_order = order
	end

	#Setter
	def current_order=(order)
		@current_order = order
	end

	#getter
	def current_order
		@current_order ||= Order.find_by_id(order_token)
	end

	#setter
	def current_user=(user)
		@current_user = user
	end

	#getter
	def current_user
		puts User.find_by_remember_token(cookies[:remember_token])
		@current_user ||= user_from_remember_token
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
		cookies.delete(:order_token)
		self.current_order = nil
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

		def order_token
			cookies.signed[:order_token] || nil
		end
end
