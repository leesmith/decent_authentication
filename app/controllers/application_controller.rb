class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated_user

  private

  def authenticated_user
    @authenticated_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_authentication
    unless authenticated_user
      redirect_to sign_in_path, alert: t(:not_authenticated)
    end
  end
end
