class SessionsController < ApplicationController

  def new
    redirect_to root_path if authenticated_user
  end

  def create
    user = User.where("email = ?", params[:email].downcase).first
    if user && user.authenticate(params[:password])
      set_cookie(user, params)
      session[:intended_destination].blank? ? redirect_to(root_url) : redirect_to(session[:intended_destination])
      session[:intended_destination] = nil
    else
      flash.now[:error] = t(:invalid_sign_in)
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to sign_in_path, flash: { success: t(:successful_sign_out) }
  end

  private

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
