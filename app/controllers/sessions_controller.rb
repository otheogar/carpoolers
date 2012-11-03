class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.uid
    session[:email]=user.email
    redirect_to userhome_url
  end

  def destroy
	session[:user_id] = nil
  session[:email]=nil
    redirect_to welcome_url
  end
end
