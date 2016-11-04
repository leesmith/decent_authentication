class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticated_user
  before_action :require_authentication
  add_flash_types :error, :success, :info, :warning

  private

  def authenticated_user
    @authenticated_user ||= User.find_by(auth_token: session[:auth_token]) if session[:auth_token]
  end

  def require_authentication
    unless authenticated_user
      session[:intended_destination] = params
      redirect_to signin_url, error: 'You must sign in to continue!'
    end
  end

end
