class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :authenticated_user

  private

  def authenticated_user
    @authenticated_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_authentication
    unless authenticated_user
      redirect_to sign_in_path, flash: { error: t(:not_authenticated) }
    end
  end

end
