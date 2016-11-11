class UsersController < ApplicationController
	before_filter :authorize, only: [:new, :edit, :update]

	def new
	  @user = User.new	
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	    session[:user_id] = @user.id
	    flash.now[:error] = "Created user."
	    redirect_to root_url
	  else
	  	flash.now[:error] = "Could not create user."
	    render "new"
	  end
	end

	def index
		@users = User.all
	end

	private 

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end