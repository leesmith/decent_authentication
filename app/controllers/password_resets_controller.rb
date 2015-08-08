class PasswordResetsController < ApplicationController

  def new
  end

  def create
    redirect_to [:new, :password_reset], flash: { error: 'You must provide an email!' } and return if params[:email].blank?
    user = User.where("email = ?", params[:email]).first
    user.send_password_reset if user
    redirect_to sign_in_path, flash: { success: 'An email was just sent to you with password reset instructions.' }
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    @user.force_password_validation = true
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, flash: { error: 'Password reset has expired! Please submit another request.' }
    elsif @user.update_attributes(user_params)
      redirect_to sign_in_path, flash: { success: 'Your password was successfully changed!' }
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
