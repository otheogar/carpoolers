class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.is_a?(UserLogin)
      UserLogin.at_signup(user_email)
	session[:homestr]=nil
      session[:homelat]=nil
      session[:homelong]=nil
      userhome_path
    else
      super
    end
  end


  private
  def user_email
    @user_email = nil
    if user_login_signed_in?
      @user_email = current_user_login.email
    else if session[:email]
        @user_email = session[:email]
    end

    end
  end
  helper_method :user_email


  def user_id
    @user_id = nil
    if user_login_signed_in?
      @user_id = current_user_login.email
    else if session[:uid]
      @user_id = session[:uid]
    end

    end
  end
  helper_method :user_id



  def current_user
    @current_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user


  protected
  def authorize
    unless current_user || user_login_signed_in?
      redirect_to welcome_url, :notice => "Please log in"
    end
  end
end
