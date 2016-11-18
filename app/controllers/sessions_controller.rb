class SessionsController < ApplicationController	
	before_filter :nav_show
	before_filter :bodycss
	
 	def new
	end
	def bodycss
		@body_id = "loginPage"
	end

  	def nav_show
  	@disable_nav = true
	end

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to site_permits_path
	  else
	    flash[:error]= "Email or password is invalid"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to site_permits_path
	end

end
