class PasswordResetsController < ApplicationController
  skip_before_action :require_authentication

  def new
  end

  def create
    redirect_to new_password_reset_url, error: 'You must provide an email address!' and return if params[:email].blank?
    user = User.find_by(email: params[:email].downcase)
    SendPasswordResetRequest.new(user).call if user
    redirect_to signin_url, success: 'An email was just sent to you with password reset instructions.' and return
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user.password_reset_sent_at <= 2.hours.ago
      redirect_to new_password_reset_url, error: 'This password reset request has expired. Please submit another request.'
    elsif params[:user][:password].blank?
      @user.errors.add(:password, "can't be blank")
      render :edit
    elsif @user.update(user_params)
      # clear out password reset fields now that they have been used
      @user.erase_password_reset_fields
      reset_session
      redirect_to signin_url, success: 'Your password was successfully changed. Please sign in.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
