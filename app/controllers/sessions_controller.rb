class SessionsController < ApplicationController
  def create
    p "User: "+params.to_s
    user_params
    user = User.where(:email => params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dhatus_url
    else
      p user
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    if User.exists?(session[:user_id])
      session[:user_id] = nil
      render :new
    else
      render_msg "User not foud"
    end
  end

  def user_params
    params.permit(:email, :user_id, :password)
  end
end