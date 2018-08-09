class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,  only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		# Handle a successful save.
  		flash[:success] = "Account Created Successfully!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # Handle a successful update
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
	 params.require(:user).permit(:name, :email, :department, :password, :password_confirmation, :avatar)
  end

  def signed_in_user
    store_location
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
