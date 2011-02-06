class UsersController < ApplicationController

  def create
    if user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  expose(:user)

end
