class UsersController < ApplicationController
  def new
    @user = User.new
    @existUsers = User.all
  end

  def create
    user = User.new(user_params)
    if user.password != user.password_confirmation
      redirect_to '/'
      return "fail to register"
    end 

    if user.save
      session[:user_id] = user.id
      redirect_to '/', notice: 'User created!'
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
