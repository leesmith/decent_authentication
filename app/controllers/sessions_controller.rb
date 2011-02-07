class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Invalid sign in attempt!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path, :notice => 'Successfully signed out!'
  end

end
