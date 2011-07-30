class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_path
    else
      flash.now.alert = t(:invalid_sign_in)
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to sign_in_path, notice: t(:successful_sign_out)
  end

end
