class ProfileController < ApplicationController

  def edit
    @user = authenticated_user
  end

  def update
    @user = authenticated_user
    if @user.update(user_params)
      redirect_to profile_url, success: 'Your profile was successfully updated!'
    else
      render :edit
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
