class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url
    else
      flash.now[:error] = t(:invalid_sign_in)
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to sign_in_path, flash: { success: t(:successful_sign_out) }
  end

end
