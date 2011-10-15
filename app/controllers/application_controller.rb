class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated_user

  private

  def authenticated_user
    @authenticated_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
