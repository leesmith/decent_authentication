class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_authentication
    unless current_user
      redirect_to sign_in_path, alert: t(:not_authenticated)
    end
  end

end
