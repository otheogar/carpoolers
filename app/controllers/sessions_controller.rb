class SessionsController < ApplicationController


  def new
  end

  def create
    auth= env["omniauth.auth"]
    user = User.from_omniauth(auth)
    session[:user_id] = user.uid
    session[:email]= auth.info.email
    redirect_to userhome_url
  end

  def destroy
	session[:user_id] = nil
  session[:email]=nil
    redirect_to welcome_url
  end
end
