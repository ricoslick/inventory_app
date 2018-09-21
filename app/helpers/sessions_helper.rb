module SessionsHelper

	def sign_in(user)
		cookies[:remember_token] = { value: user.remember_token, expires: 2.hours.from_now }
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.fullpath
	end

	def session_expires
		t = Time.current
		@time_left = (session[:expires_at] = t + 10.minutes).to_i - (Time.current).to_i
		unless @time_left > 0.seconds.to_i
			reset_session
			flash[:info] = 'Session Expired. Please login again to continue'
			redirect_to signin_path
		end
	end

	def update_session_time
		session[:expires_at] = Time.now + 600.seconds
	end
end
