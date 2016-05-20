class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # call 'byebug' in rails server that acts as rails console
    # debugger
  end

  def new
  end
end
