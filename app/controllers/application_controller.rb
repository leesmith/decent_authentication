class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_authentication
    unless current_user
      redirect_to sign_in_path, :alert => 'You must be authenticated to access this page!'
    end
  end

end
