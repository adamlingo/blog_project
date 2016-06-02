class UsersController < ApplicationController
  # check before edit and update that user is logged in and current user
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # former v. of Rails uses params, but now use strong params instead
    # @user = User.new(params[:user])
    @user = User.new(user_params)
    # handle save or re-route to new form
    if @user.save
      # login user immediately after signup
      log_in @user
      flash[:success] = "Welcome to the Blog Project"
      # redirect to show action
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Must confirm correct user or redirect
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
