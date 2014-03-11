class UsersController < ApplicationController

  before_filter :authorize

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dhatus_url, notice: "Thank you for signing up!"
    else
      render new_user_path
    end
  end

  def user_params
    params[:user].permit(:email, :name, :password, :password_confirmation)
  end
end