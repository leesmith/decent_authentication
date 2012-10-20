class PasswordResetsController < ApplicationController

  def create
    redirect_to [:new, :password_reset], flash: { error: t(:provide_email) } and return if params[:email].blank?
    user = User.where("email = ?", params[:email]).first
    user.send_password_reset if user
    redirect_to sign_in_path, flash: { success: t(:reset_email) }
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, flash: { error: t(:password_reset_expired) }
    elsif @user.update_attributes(params[:user])
      redirect_to sign_in_path, flash: { success: t(:change_password_success) }
    else
      render :edit
    end
  end

end
