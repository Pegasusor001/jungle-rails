class UsersController < ApplicationController
  # email = User.
  # http_basic_authenticate_with email: email, password: password
  # User.find_by(email: 'test@email.com')&.authenticate(12345) 

  def index
    @users = User.all
    password = User.find_by(email: 'test@email.com').password
    puts @users
    puts password
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:users], notice: 'User created!'
    else
      render :new
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to [:users], notice: 'User deleted!'
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
end
