class LoginController < ApplicationController
  def index
    user = User.find_by_email("test@test.com")
    # puts user
    # puts user.password
  end
  
  def login
    user = User.find_by_email(params[:email])
    right_password = user.password
    if user && right_password == params[:password]
      session[:user_id] = user.id
      puts "xxxxxxxxx"
      puts session[:user_id]
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/login"
  end
end
