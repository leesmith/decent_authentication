class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to sign_in_path, flash: { success: t(:registration) }
    else
      render :new
    end
  end

end
