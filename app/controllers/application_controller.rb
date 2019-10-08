class ApplicationController < ActionController::Base

before_action :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

def is_owner
    @current_user && @current_user.role == "owner"
end


  def authorize
    redirect_to '/' unless current_user
  end
end
