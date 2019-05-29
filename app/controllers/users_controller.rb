class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def my_info
    @user = User.find(current_user.id)
    render json: @user
  end

end
