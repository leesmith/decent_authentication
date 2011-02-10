class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = t(:invalid_sign_in)
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path, :notice => t(:successful_sign_out)
  end

end
