class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Hey there, #{@user.username}! Welcome to MessageMe"
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid sign up credentials'
      render 'new'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end