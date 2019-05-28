class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    @user = login(user_params[:email], user_params[:password])
    if @user
      render :create, status: 200
    else
      render json: {error: 'Invalid Email or Password'}, status: 401
    end
  end

  def destroy
    byebug
    logout
    render json: {message: "You are logged out"}, status: 200
  end

  private

  def user_params
    params.require(:sign_in).permit(:email, :password)
  end
end