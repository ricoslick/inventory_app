class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,  only: [:edit, :update]
  before_action :admin_user,    only: :destroy
  
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @devices = @user.devices.paginate(page: params[:page], per_page: 5)
    @customers = @user.customers.paginate(page: params[:page], per_page: 4)
    # @devicess = @user.devices.text_search(params[:query]).page(params[:page]).per_page(5)

    if params[:query].present?
      @devices = @user.devices.search(params[:query]).paginate(page: params[:page], per_page: 5)
      render 'show'
    else
      @devices =  @user.devices.paginate(page: params[:page], per_page: 5)
    end
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		# Handle a successful save.
      @user.send_activation_email
  		flash[:info] = "Please check your email to activate your account."
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

  def index
    @users = User.all 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Account Deleted"
    password-reset
    redirect_to users_path
  end

  private

  def user_params
	 params.require(:user).permit(:name, :email, :department, :password, :password_confirmation, :avatar, :query)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
