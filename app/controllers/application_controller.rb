class ApplicationController < ActionController::API

  def current_user
    User.find(33)
  end
end
