class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
  end
end