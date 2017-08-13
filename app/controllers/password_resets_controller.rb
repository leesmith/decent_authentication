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

    if @user.blank?
      redirect_to new_password_reset_url, error: 'Invalid request! Please use the form below to request password reset instructions again.' and return
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    password_recovery = RecoverPassword.new(@user, params).call

    if password_recovery.expired?
      redirect_to new_password_reset_url, error: password_recovery.flash
    elsif password_recovery.blank_password?
      render :edit
    elsif password_recovery.success?
      reset_session
      redirect_to signin_url, success: password_recovery.flash
    else
      render :edit
    end
  end

end
