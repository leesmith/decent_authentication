class UsersController < ApplicationController
  expose(:user)

  def create
    if user.save
      redirect_to root_path, notice: t(:registration)
    else
      render :new
    end
  end
end
