class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_profile

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_profile
    @current_profile ||= Profile.find_by(user_id: session[:user_id]) if session[:user_id]
  end
end
