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
      flash[:success] = "Hey there, #{@user.username}! Welcome to Stylts"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end