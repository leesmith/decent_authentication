class PasswordResetsController < ApplicationController

  expose(:user) { User.find_by_password_reset_token!(params[:id]) }

  def create
    redirect_to [:new, :password_reset], alert: t(:provide_email) and return if params[:email].blank?
    user = User.where("email = ?", params[:email]).first
    user.send_password_reset if user
    redirect_to sign_in_path, notice: t(:reset_email)
  end

  def update
    if user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: t(:password_reset_expired)
    elsif user.update_attributes(params[:user])
      redirect_to sign_in_path, notice: t(:change_password_success)
    else
      render :edit
    end
  end
end
