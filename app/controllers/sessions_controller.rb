class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  
  def create
    @user = User.find_by(email: signin_params[:email])
    if @user && @user.valid_password?(signin_params[:password])
      session[:user_id] = user.id

      render json: :create, status: 200
    else
      render json: {errors: 'Invalid email or password'}, status: 401
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])

    if @user
      session[:user_id] = nil
      render json: {message: 'User is successfully logged out'}, status: 200
    else
      render json: {}, status: 422
    end
  end

  private

  def signin_params
    params
    .require(:sign_in)
    .permit(:email, :password)
  end
end
