class UsersController < ApplicationController
  before_action :require_authentication, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.enabled = true
    if @user.save
      redirect_to signin_url, success: 'Thanks for signing up! You may now sign in.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
