class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # call 'byebug' in rails server that acts as rails console
    # debugger
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
