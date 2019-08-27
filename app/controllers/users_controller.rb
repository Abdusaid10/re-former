# Users Controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(whitelisted_user_params)
    if @user.save
      redirect_to @user
    else
      render :edit
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
