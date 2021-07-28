class SessionsController < ApplicationController
  def index
  end
  
  def create
    user = User.find_by_email(params[:email])
    # right_password = user.password
    # User.authenticate_with_credentials (params[:email], params[:password])
    # authenticate can be by session. user.authenticate can encrypt the password. 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
