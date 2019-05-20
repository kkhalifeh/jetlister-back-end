class ApplicationController < ActionController::API

  def current_user
    User.find(35)
  end
end
