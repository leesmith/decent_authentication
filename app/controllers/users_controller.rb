class UsersController < ApplicationController
  before_filter :require_authentication, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to root_path, flash: { success: t(:thanks) }
    else
      render :new
    end
  end

  def show
    @user = User.where(id: params[:id]).first
  end

end
