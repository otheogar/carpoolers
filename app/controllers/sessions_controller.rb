class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.uid
    redirect_to userhome_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_url
  end
end
