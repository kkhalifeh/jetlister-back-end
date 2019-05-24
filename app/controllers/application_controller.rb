class ApplicationController < ActionController::API
  
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session


  before_action :set_csrf_token
  before_action :authenticate_user, except: [:heartbit]
  # skip_before_action :verify_authenticity_token, only: [:heartbit]

  def heartbit
    render json: {}, status: :ok
  end

  def current_user
    @user
  end
  helper_method :current_user

  private

  def set_csrf_token
    response.set_header("X-App-CSRF-Token", form_authenticity_token)
  end

  def authenticate_user
    if session[:user_id].present? && @user = User.find_by(id: session[:user_id])
      true
    else
      render(json: {}, status: 401) and return
    end
  end
end
