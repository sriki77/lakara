class UsersController < ApplicationController
  before_filter :authorize, :except => :create

  def create

    return render_with 400, "Invalid Request" unless params[:user]

    @user = User.new(user_params)

    if @user.save
      render_msg @user.email
    else
      render_with 403, "#{@user.errors.to_json} "
    end

  end


  def user_params
    params[:user].permit(:email, :name, :password, :password_confirmation)
  end
end