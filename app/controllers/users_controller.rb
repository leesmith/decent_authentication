class UsersController < ApplicationController
  expose(:user)

  def create
    if user.save
      redirect_to sign_in_path, flash: { success: t(:registration) }
    else
      render :new
    end
  end
end
