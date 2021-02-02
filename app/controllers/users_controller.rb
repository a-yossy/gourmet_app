class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  def index
    @users = User.all
  end

end
