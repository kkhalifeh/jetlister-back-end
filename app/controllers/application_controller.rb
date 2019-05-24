class ApplicationController < ActionController::API
  before_action :set_csrf_token
  before_action :authenticate_user

  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception


  def current_user
    @user
  end
  helper_method :current_user

  private

  def set_csrf_token
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end

  def authenticate_user
    if session[:user_id].present? && @user = User.find_by(id: session[:user_id])
      true
    else
      render(json: {}, status: 401) and return
    end
  end
end
