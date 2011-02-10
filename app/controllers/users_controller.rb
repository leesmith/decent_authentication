class UsersController < ApplicationController

  def create
    if user.save
      redirect_to sign_in_path, :notice => t(:registration)
    else
      render 'new'
    end
  end

  expose(:user)

end
