class SessionsController < ApplicationController

  def new
    redirect_to root_path if authenticated_user
  end

  def create
    user = User.where("email = ?", params[:email].downcase).first
    if AuthenticateUser.call(user, params)
      set_cookie(user, params)
      redirect_to(sign_in_destination)
    else
      flash.now[:error] = 'Invalid sign in attempt!'
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to sign_in_path, success: 'Successfully signed out!'
  end

  private

  def sign_in_destination
    intended_destination = session[:intended_destination]
    session[:intended_destination] = nil
    intended_destination.blank? ? root_url : intended_destination
  end

  def set_cookie(user, params)
    if params[:remember_me]
      # set a permanent cookie (expiring in 20 years)
      cookies.permanent[:auth_token] = user.auth_token
    else
      # set a session cookie (deleted when browser is closed)
      cookies[:auth_token] = user.auth_token
    end
  end

end
