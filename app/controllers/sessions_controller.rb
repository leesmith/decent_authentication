class SessionsController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]

  def new
    redirect_to root_url if authenticated_user
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    authentication_attempt = AuthenticateUser.new(user, params).call
    if authentication_attempt.success?
      intended_url = session[:intended_destination]
      reset_session
      session[:auth_token] = user.auth_token
      user.touch(:last_sign_in_at)
      flash[:success] = authentication_attempt.flash
      redirect_to intended_url.blank? ? root_url : intended_url
    else
      flash.now[:error] = authentication_attempt.flash
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to signin_url, success: 'You have successfully signed out!'
  end

end
