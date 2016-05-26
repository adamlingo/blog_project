class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # ternary operator for if/then
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # .now makes flash contents disappear upon additional request
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
