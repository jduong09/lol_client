class ApplicationController < ActionController::Base

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this session"
      redirect_to new_session_url
    end
  end
end
