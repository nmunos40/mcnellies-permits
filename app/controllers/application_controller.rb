class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_mailer_host

  private 

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
		redirect_to login_url, alert: "Not authorized" if current_user.nil?
	end

	def admin
		redirect_to root_path, alert: "Not authorized - Only admins can create new users." if !current_user.admin?
	end
  
	def set_mailer_host
	    ActionMailer::Base.default_url_options[:host] = request.host_with_port
	end
end
