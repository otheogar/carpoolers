class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.uid
    redirect_to welcome_url #change to redirect_to home_url
  end

  def destroy
    session[:user_id] = nil
  end
end
