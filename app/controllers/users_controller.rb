class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :require_admin!, except: [:show]

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.order('created_at DESC').page(params[:page])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash[:success] = "User deleted..."
    end
    redirect_to users_path
  end

  def toggle_rights
    respond_to do |format|
      @user = User.find_by(id: params[:id])
      @user.toggle!(:admin) if @user
      format.js
    end
  end
end