class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user
  
  def create
    @user = User.new(signup_params)
    if @user.save
      render json: :create, status: 201
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
  end

  private

  def signup_params
    params
      .require(:sign_up)
      .permit(:email, :password, :password_confirmation, :first_name, :last_name, :username)
  end
end
