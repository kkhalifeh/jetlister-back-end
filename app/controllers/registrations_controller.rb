class RegistrationsController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.new(user_params)
    if @user.save
      render :create, status: 201
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  private

  def user_params
    params.require(:sign_up).permit(:email, :password, :password_confirmation, :username, :first_name, :last_name)
  end
end
