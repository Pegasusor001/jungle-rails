class SessionsController < ApplicationController
  def index
  end
  
  def create
    user = User.find_by_email(params[:email])
    right_password = user.password
    if user && right_password == params[:password]
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
