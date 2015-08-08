class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :authenticated_user

  private

  def authenticated_user
    @authenticated_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_authentication
    unless authenticated_user
      session[:intended_destination] = params
      redirect_to sign_in_path, flash: { error: 'Please sign in before continuing!' }
    end
  end

end
