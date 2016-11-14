class UsersController < ApplicationController
	before_filter :authorize, only: [:new, :edit, :update, :show, :create, :show, :index]
	before_filter :setup_user
	before_filter :admin, only: [:new, :update]

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

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated successfully."
			 redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def edit
	end

	def show 
	end

	def index
		@users = User.all
	end

	private 

	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :admin, :email, :password, :password_confirmation)
	end

	def setup_user
		@user 	||= User.find(session[:user_id]) if session[:user_id]
	end

end