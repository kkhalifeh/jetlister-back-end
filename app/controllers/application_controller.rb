class ApplicationController < ActionController::API
  
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception

  before_action :require_login, except: [:heartbit]
  after_action :set_csrf_cookie
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def heartbit
    render json: {message: 'App is up...'}, status: 200
  end

  private

  def set_csrf_cookie
    cookies["X-App-CSRF-Token"] = form_authenticity_token
  end
end
